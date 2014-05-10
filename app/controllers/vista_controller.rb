class VistaController < ApplicationController
 skip_before_filter :authorize
  
  def inicio
    @identifiant="vistaInicial"
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' group by nombres having count(*) > 2 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' group by nombres having count(*) > 2 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' group by nombres order by nombres")
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
    @productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
  end
  def contactar
    @productos = Producto.search(params[:search])
    @productos1= Producto.find_by_sql("select marca from productos group by marca order by marca")
    @productoCop=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Copeland' group by nombres having count(*) > 2 order by nombres")
    @productoCarr=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Carrier' group by nombres having count(*) > 2 order by nombres")
    @productoTran=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'Trane' group by nombres order by nombres")
    @productoYork=Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca = 'York' group by nombres order by nombres")
    @productoMis = Producto.find_by_sql("select split_part(nombre,' ', 1) AS nombres,count(*) AS number from productos where marca like '#{@marca}' group by nombres having count(*) <= 3") 
  end

end
