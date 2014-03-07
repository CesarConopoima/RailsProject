class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	PAYMENT_TYPES = [ "Deposito Bancario" , "Transferencia Bancaria","Pago en la tienda"]
	validates_presence_of :nombre, message => "Esta casilla no puede estar en blanco" 
	validates_presence_of :empresa, message => "Esta casilla no puede estar en blanco"
	validates_presence_of :direccion, message => "Esta casilla no puede estar en blanco" 
	validates_presence_of :email, message => "Esta casilla no puede estar en blanco" 
	validates_presence_of :telefono, message => "Esta casilla no puede estar en blanco"  
	validates :tipoPago, inclusion: PAYMENT_TYPES
	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end
end
