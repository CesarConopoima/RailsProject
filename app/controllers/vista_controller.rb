class VistaController < ApplicationController
 #skip_before_filter :authorize
  
  def inicio
    @identifiant="vistaInicial"
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' group by nombres having count(*) > 2 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' group by nombres having count(*) > 2 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' group by nombres order by nombres")
    @productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' group by nombres order by nombres")
    @productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
  end

  def empresa
    @identifiant="vistaEmpresa"
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' group by nombres having count(*) > 2 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' group by nombres having count(*) > 2 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' group by nombres order by nombres")
    @productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' group by nombres order by nombres")
    @productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
  end

  def servicio
    @identifiant="servicio"
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' group by nombres having count(*) > 2 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' group by nombres having count(*) > 2 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' group by nombres order by nombres")
    @productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' group by nombres order by nombres")
    @productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
  end
  def contactar
    @identifiant="vistaContacto"
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' group by nombres having count(*) > 2 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' group by nombres having count(*) > 2 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' group by nombres order by nombres")
    @productoBitzer=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Bitzer' group by nombres order by nombres")
    @productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
  end
  def status
    @identifiant="vistaStatus"
    @productos = Producto.search(params[:search])
    @productos1= Producto.marcas
    @productoCop=Producto.find_by_sql("select nombre from (select nombre,count() 
            AS number from productos 
            where marca = 'Copeland' group by SUBSTR(nombre,0,6))
            where number > 6")
    @productoCarr=Producto.find_by_sql("select nombre from (select nombre,count() 
            AS number from productos 
            where marca = 'Carrier' group by SUBSTR(nombre,0,6))
            where number > 6")
    @productoTran=Producto.find_by_sql("select nombre from productos where marca = 'Trane' group by SUBSTR(nombre,0,4)")
    @productoYork=Producto.find_by_sql("select nombre from productos where marca = 'York' group by SUBSTR(nombre,0,4)")
    
    @usuario = current_user.id
    @orders=Order.find_by_sql("select id,status,updated_at from orders where userid=#{@usuario}")
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
