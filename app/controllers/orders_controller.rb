class OrdersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]
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

    if @cart.line_items.empty?
      redirect_to tienda_url, notice: "Tu carro de compras esta vacio"
      return
    end
    
    @order = Order.new
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

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
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
