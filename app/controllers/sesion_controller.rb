class SesionController < ApplicationController
  #skip_before_filter :authorize

  def nueva
  end

  def crear
  	usuario = Usuario.find_by_nombre(params[:nombre])
	 if usuario and usuario.authenticate(params[:password])
		 session[:usuario_id] = usuario.id
		 redirect_to admin_url
	 else
	 	redirect_to login_url, alert: "Combinacion usuario/password invalida"
	 end
  end

  def borrar
  	session[:usuario_id] = nil
  	redirect_to tienda_url, notice: "Logged out"
  end

end
