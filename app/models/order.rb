class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	PAYMENT_TYPES = [ "Deposito Bancario" , "Tarjeta de Credito", "Cheque" ]
	validates :nombre, :empresa, :direccion, :email, :telefono, presence: true
	validates :tipoPago, inclusion: PAYMENT_TYPES
	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end
end
