class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	PAYMENT_TYPES = [ "Deposito Bancario" , "Transferencia Bancaria","Pago en la tienda"]
	SEND_TYPES = [ "MRW" , "ZOOM","DHL","Busqueda en la Tienda"]
	VENEZUELA_ESTADOS = [ "Anzoátegui","Amazonas","Apure","Aragua","Barinas","Bolivar","Carabobo","Cojedes","Delta Amacuro","Distrito Capital","Falcon","Guarico","Lara","Merida","Miranda","Monagas","Nueva Esparta","Portuguesa","Tachira","Trujillo","Yaracuy","Zulia"]
	validates :nombre, :empresa, :direccion, :email, :telefono, presence: true
	validates :tipoPago, inclusion: PAYMENT_TYPES
	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end
end
