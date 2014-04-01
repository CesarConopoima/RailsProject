class TiendaController < ApplicationController
 skip_before_filter :authorize
  
  def index
  	@productos = Producto.search(params[:search])
  	@productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' group by nombres having count(*) > 2 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' group by nombres having count(*) > 2 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' group by nombres order by nombres")
    @cart = current_cart
    @productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
  end

  def pagina
    @cart = current_cart
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' group by nombres having count(*) > 2 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' group by nombres having count(*) > 2 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' group by nombres order by nombres")
    @marca = params[:marca].downcase.capitalize
    @productos1 = Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productos2 = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres order by nombres")
    @productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 2")  
  end

  def vista
    @cart = current_cart
    @productos = Producto.search(params[:search])
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' group by nombres having count(*) > 2 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' group by nombres having count(*) > 2 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' group by nombres order by nombres")
    @productos1 = Producto.find_by_sql("select marca from productos group by marca order by marca")
    @marca = params[:marca].downcase.capitalize
    @nombre = params[:nombre].split(" ").first.upcase 
    @productos2 = Producto.vista(params[:marca],params[:nombre]).paginate(:page => params[:page], :per_page => 6)
    @productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 2") 
  end 

  def miscelaneus
    @productos = Producto.search(params[:search])
    @productos1 = Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' group by nombres having count(*) > 2 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' group by nombres having count(*) > 2 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' group by nombres order by nombres")
    @cart = current_cart    
    @marca = params[:marca].downcase.capitalize
    @productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) 
        AS nombres,count(*) AS number from productos where marca like '#{@marca}' 
        group by nombres having count(*) <= 3") 
  end
  def vistaDetalle
    @cart = current_cart    
    @productos = Producto.search(params[:search])
    @productos1 = Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' group by nombres having count(*) > 2 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' group by nombres having count(*) > 2 order by nombres")
    @productoTran=Producto.find_by_sql("select nombre AS nombres from productos where marca = 'Trane' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select nombre AS nombres from productos where marca = 'York' group by nombres order by nombres")
    @marca = params[:marca].downcase.capitalize
    @nombre = params[:nombre]
    @modelo = params[:modelo].split("/").first.to_s
    @productos2 = Producto.find_by_sql("select * from 
    productos where marca = '#{@marca}' 
    and nombre like '#{@nombre}%' 
    and modelo like '%#{@modelo}%' ")
  end

end
