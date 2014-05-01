class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers
  skip_before_filter :authorize, only: [:devise]
  protect_from_forgery
  
  private

  	def current_cart
		Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end
  def has_role?(current_user, role)
    return !!current_user.roles.find_by_name(role.to_s.camelize)
  end

  protected

  	def authorize
  		unless Usuario.find_by_id(session[:usuario_id])
  			redirect_to login_url, notice: "Porfavor haz log in"
  		end
  	end

end
