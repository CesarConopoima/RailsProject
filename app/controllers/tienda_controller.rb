class TiendaController < ApplicationController
 skip_before_filter :authorize
  
  def index
  	@productos = Producto.search(params[:search])
  	@productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from products where marca = 'Copeland' group by nombres having count(*) > 6")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from products where marca = 'Carrier' group by nombres having count(*) > 6")
    @productoTran=Producto.find_by_sql("select nombre from productos where marca = 'Trane' group by nombre")
    @productoYork=Producto.find_by_sql("select nombre from productos where marca = 'York' group by nombre")
    @cart = current_cart
  end

  def pagina
    @cart = current_cart
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from products where marca = 'Copeland' group by nombres having count(*) > 6")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from products where marca = 'Carrier' group by nombres having count(*) > 6")
    @productoTran=Producto.find_by_sql("select nombre from productos where marca = 'Trane' group by nombre")
    @productoYork=Producto.find_by_sql("select nombre from productos where marca = 'York' group by nombre")
    @marca = params[:marca].downcase
    @productos1 = Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productos2 = Producto.find_by_sql("select * from productos where marca like '#{@marca}' group by SUBSTR(nombre,0,4)")
  end

  def vista
    @cart = current_cart
     @productoCop=Producto.find_by_sql("select nombre from (select nombre,count() 
            AS number from productos 
            where marca = 'Copeland' group by SUBSTR(nombre,0,4))
            where number > 6")
    @productoCarr=Producto.find_by_sql("select nombre from (select nombre,count() 
            AS number from productos 
            where marca = 'Carrier' group by SUBSTR(nombre,0,4))
            where number > 6")
    @productoTran=Producto.find_by_sql("select nombre from productos where marca = 'Trane' group by nombre)")
    @productoYork=Producto.find_by_sql("select nombre from productos where marca = 'York' group by nombre")
    @marca = params[:marca].downcase
    @nombre = params[:nombre].downcase.split("MOD").first.split(" ").first
    @productos1 = Producto.marcas
    @productos2 = Producto.find_by_sql("select nombre,imageurl,marca,codigo from productos where marca like '#{@marca}' and nombre like '#{@nombre}%'")
  end 

  def miscelaneus
    @productos = Producto.search(params[:search])
    @productos1= Producto.marcas
    @productoCop=Producto.find_by_sql("select nombre from (select nombre,count() 
            AS number from productos 
            where marca = 'Copeland' group by SUBSTR(nombre,0,4))
            where number > 6")
    @productoCarr=Producto.find_by_sql("select nombre from (select nombre,count() 
            AS number from productos 
            where marca = 'Carrier' group by SUBSTR(nombre,0,4))
            where number > 6")
    @productoTran=Producto.find_by_sql("select nombre from productos where marca = 'Trane' group by nombre")
    @productoYork=Producto.find_by_sql("select nombre from productos where marca = 'York' group by nombre")
    @cart = current_cart    
    @marca = params[:marca].downcase.capitalize
    @productoMis = Producto.find_by_sql("select * from (select *,count() 
            AS number from productos 
            where marca = '#{@marca}' group by SUBSTR(nombre,0,4))
            where number <= 6") 
  end
  def vistaDetalle
    @cart = current_cart    
    @productos = Producto.search(params[:search])
    @productos1= Producto.marcas
    @productoCop=Producto.find_by_sql("select nombre from (select nombre,count() 
            AS number from productos 
            where marca = 'Copeland' group by SUBSTR(nombre,0,4))
            where number > 6")
    @productoCarr=Producto.find_by_sql("select nombre from (select nombre,count() 
            AS number from productos 
            where marca = 'Carrier' group by SUBSTR(nombre,0,4))
            where number > 6")
    @productoTran=Producto.find_by_sql("select nombre from productos where marca = 'Trane' group by nombre")
    @productoYork=Producto.find_by_sql("select nombre from productos where marca = 'York' group by nombre")
    @marca = params[:marca].downcase.capitalize
    @nombre = params[:nombre]
    @modelo = params[:modelo].split("/").first.to_s
    @productos2 = Producto.find_by_sql("select * from 
    productos where marca = '#{@marca}' 
    and nombre like '#{@nombre}%' 
    and modelo like '%#{@modelo}%' ")
  end

end
