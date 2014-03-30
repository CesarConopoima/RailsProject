class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	PAYMENT_TYPES = [ "Deposito Bancario" , "Transferencia Bancaria","Pago en la tienda"]
	SEND_TYPES = [ "MRW" , "ZOOM","DHL","Busqueda en la Tienda"]
	VENEZUELA_ESTADOS = [ "Anzoategui","Amazonas","Apure","Aragua","Barinas","Bolivar","Carabobo","Cojedes","Delta Amacuro","Distrito Capital","Falcon","Guarico","Lara","Merida","Miranda","Monagas","Nueva Esparta","Portuguesa","Tachira","Trujillo","Vargas","Yaracuy","Zulia"]
	validates :nombre,:presence => { :message => "Este campo debe ser llenado" }
	validates :empresa,:presence => { :message => "Este campo debe ser llenado" }
	validates :direccion,:presence => { :message => "Este campo debe ser llenado" }
	validates :email,:presence => { :message => "Este campo debe ser llenado" }
	validates :telefono,:presence => { :message => "Este campo debe ser llenado" }
	validates :direccionaux,:presence => { :message => "Este campo debe ser llenado" }
	validates :telefonoaux,:presence => { :message => "Este campo debe ser llenado" }
	validates :tipoPago, inclusion: PAYMENT_TYPES
	validates :tipoenvio, inclusion: SEND_TYPES
	validates :localidadvenezuela, inclusion: VENEZUELA_ESTADOS
	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end
	def validate_presence(cart)
		cart.line_items.each do |item|
			@quantity = item.quantity
			@cantidad = item.producto.cantidad
			@producto_no_dispo = ["OK",1]
			if @quantity >= @cantidad
				@producto_no_dispo = ["#{item.producto.nombre}",@cantidad]
				break
			else
				@producto_no_dispo
			end
		end
		return @producto_no_dispo
	end
end
