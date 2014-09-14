class VistaController < ApplicationController
 #skip_before_filter :authorize
  
  def inicio
    @identifiant="vistaInicial"
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' and flag1='no' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' and flag1='no' group by nombres order by nombres")
    @productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' and flag1='no' group by nombres order by nombres")
    #@productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' group by nombres order by nombres")
    #@productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
    @productoMis = Producto.find_by_sql("select nombre from productos where marca like '#{@marca}' and flag1='si' ") 
  end

  def empresa
    @identifiant="vistaEmpresa"
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' and flag1='no' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' and flag1='no' group by nombres order by nombres")
    @productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' and flag1='no' group by nombres order by nombres")
    #@productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
    @productoMis = Producto.find_by_sql("select nombre from productos where marca like '#{@marca}' and flag1='si' ") 
  end

  def servicio
    @identifiant="servicio"
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' and flag1='no' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' and flag1='no' group by nombres order by nombres")
    @productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' and flag1='no' group by nombres order by nombres")
    #@productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
    @productoMis = Producto.find_by_sql("select nombre from productos where marca like '#{@marca}' and flag1='si' ") 
  end
  def contactar
    @identifiant="vistaContacto"
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' and flag1='no' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' and flag1='no' group by nombres order by nombres")
    @productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' and flag1='no' group by nombres order by nombres")
    #@productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
    @productoMis = Producto.find_by_sql("select nombre from productos where marca like '#{@marca}' and flag1='si' ") 
  end
  def video
    @identifiant="vistaVideo"
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' and flag1='no' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' and flag1='no' group by nombres order by nombres")
    @productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' and flag1='no' group by nombres order by nombres")
    #@productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
    @productoMis = Producto.find_by_sql("select nombre from productos where marca like '#{@marca}' and flag1='si' ") 
  end
  def status
    @identifiant="vistaStatus"
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' and flag1='no' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' and flag1='no' group by nombres order by nombres")
    @productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' and flag1='no' group by nombres order by nombres")
    #@productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
    @productoMis = Producto.find_by_sql("select nombre from productos where marca like '#{@marca}' and flag1='si' ") 
    @usuario = current_user.id
    @orders=Order.find_by_sql("select id,status,updated_at from orders where userid=#{@usuario}")
  end

def pagarorden
    #ojo cuando se ejecuta este paso preguntar si es necesario disminuir
    #la cantidad aquí o si eso estará articulado en el profit
    @identifiant="vistaPagar"
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' and flag1='no' group by nombres having count(*) > 0 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' and flag1='no' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' and flag1='no' group by nombres order by nombres")
    @productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' and flag1='no' group by nombres order by nombres")
    @productoMis = Producto.find_by_sql("select nombre from productos where marca like '#{@marca}' and flag1='si' ") 
    @order = Order.find(params[:id])
end

    def self.productos(user_id,order_id)
        @productos=[]
        @cantidad=[]
        @orders = Order.find_by_sql("select id from orders where userid=#{user_id} and id=#{order_id}")
        @orders[0].line_items.each do |item|
            @productos << Producto.find_by_id(item.producto_id)
            @cantidad << item.quantity
        end
       return @productos,@cantidad
    end

end
