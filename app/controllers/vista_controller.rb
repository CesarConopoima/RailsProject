class VistaController < ApplicationController
 skip_before_filter :authorize
  
  def inicio
    @productos1= Producto.find_by_sql("select * from productos group by marca")
    @cart = current_cart
  end

  def empresa
    @productos1= Producto.find_by_sql("select * from productos group by marca")
    @cart = current_cart
  end

  def servicio
    @productos1= Producto.find_by_sql("select * from productos group by marca")
    @cart = current_cart
  end

  def contactar
    @productos1= Producto.find_by_sql("select * from productos group by marca")
    @cart = current_cart
  end
end
