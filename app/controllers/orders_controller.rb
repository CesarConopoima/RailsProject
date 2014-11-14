class OrdersController < ApplicationController
  #skip_before_filter :authorize, only: [:new, :create]
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_authorize_resource :only => [:new,:create,:update]
  # GET /orders
  # GET /orders.json

  def index
    @orders = Order.all
    
  respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    @productoID = []
    @productos = []
    @cantidad = []

    @order.line_items.each do |item|
      @productoID << item.producto_id
      @cantidad << item.quantity
    end 
    @productoID.each do |id|
      @productos << Producto.find_by_id(id)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' group by nombres having count(*) > 6")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' group by nombres having count(*) > 6")
    @productoTran=Producto.find_by_sql("select nombre AS nombres from productos where marca = 'Trane' group by nombres")
    @productoYork=Producto.find_by_sql("select nombre AS nombres from productos where marca = 'York' group by nombres")
    @productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' group by nombres order by nombres")
    @cart = current_cart
    @producto_id=@cart.line_items
    
    @usuario = current_user
    
    if @cart.line_items.empty?
      redirect_to tienda_url, notice: "Tu carro de compras esta vacio"
      return
    end
    
    @order = Order.new
    @order.nombre = @usuario.nombre
    @order.empresa = @usuario.nombreEmpresa
    @order.direccion = @usuario.direccion
    @order.telefono = @usuario.telefono
    @order.localidadvenezuela = @usuario.localidadVenezuela
    @order.email = @usuario.email


    respond_to do |format|
      @validacion = @order.validate_presence(current_cart)
      if @validacion[0] != "OK"
      flash[:notice] = "Actualmente no poseemos la cantidad demandada del producto #{@validacion[0]} "
      format.html { redirect_to tienda_url}
      format.json { render json: @order }
      else
      format.html # new.html.erb
      format.json { render json: @order }
      end
    end
    
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @usuario = current_user
    @role = @usuario.role_ids
  end

  # POST /orders
  # POST /orders.json
def create
    @orders_number = Order.all.count
    @cart = current_cart
    if simple_captcha_valid?
      if @orders_number < 120
            if !@cart.line_items.empty?
            @order = Order.new(params[:order])
            @order.userid = current_user.id
            @order.status = "Orden de compra recibida y en espera por pago para continuar el proceso de despacho"
            #estos campos se llenan automaticamente cuando la orden se
            #crea para luego validarla cuando los usuarios hagan el pago de la orden
            @order.banco = "Seleccione su Banco"
            @order.numerodepago = "0"
            @order.monto = "0"
            #El tipo de envio por defecto sera mrw
            @order.tipoenvio = "MRW (Pago en destino)"
            @total_price=current_cart.total_price #calcula el total del precio que aparece en el carrito de compras
            @order.add_line_items_from_cart(current_cart)
            @orderCreate=Order.new(params[:order])
                respond_to do |format|
                  if @order.save
                    OrderNotifier.received(@order,@total_price).deliver
                    OrderNotifier.recibido(@order,@total_price).deliver
                    Cart.destroy(session[:cart_id])
                    session[:cart_id] = nil
                    @cart.destroy
                    format.html { redirect_to tienda_url, notice: 'Gracias por tu orden, te hemos enviado un correo con el resumen de tu pedido' }
                    format.json { render json: @order, status: :created, location: @order }
                  else
                    @cart = current_cart
                    format.html { render action: "new" }
                    format.json { render json: @order.errors, status: :unprocessable_entity }
                  end
                end
            else
              redirect_to tienda_url, notice: "Tu pedido no se proceso, tu carro de compras esta vacio"
            return
            end
      else
      redirect_to tienda_url, notice: "Disculpe, en este momento no podemos procesar su pedido"
      return
      end
    else
      redirect_to tienda_url, notice: "La serie que introdujiste no corresponde con la imagen"
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    @usuario = current_user
    @role = @usuario.role_ids
    if simple_captcha_valid?
    respond_to do |format|
      if @order.update_attributes(params[:order])
        #validación para saber que tipo de actualización se está haciendo
        #si es del cliente significa que indicó los datos de la compra
        if @role[0] == 2 and @order.numerodepago != "0" and @order.monto != "0" and @order.banco != "Seleccione su Banco" 
        #aquí va un mailer para avisarle a la gente de copelancita sobre la información del pago 
        #Ojo!, es necesario aquí el timer para que no se eliminé la compra?Productos enviados, en espera por acuse de recibo
        @order.status = "Comprobando datos del pago"
        @order.save
        OrderNotifier.paymentInformation(@order).deliver
        #este mailer es para el cliente, donde se le informa acerca del cambio de estatus
        format.html { redirect_to tienda_url, notice: 'Gracias por su pago, en breve confirmaremos los datos del mismo' }
        format.json { head :no_content }
        #Aqui poner elsif para considerar el cambio de estatus de  la orden por parte del admin
        elsif @role[0] == 3 
        #Este mailer se envia cuando el administrador cambia el status de la orden
        @order.save
        OrderNotifier.statuschanged(@order).deliver
        format.html { redirect_to (:back), notice: 'Orden actualizada' }
        format.json { head :no_content }
        else
        format.html { redirect_to (:back), notice: 'El cambio de estatus no fue procesado, asegurese que todos los campos estan llenos' }
        format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    
    else
    
    redirect_to (:back), notice: "La serie que introdujo no corresponde con la imagen"      
    end 
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

end
