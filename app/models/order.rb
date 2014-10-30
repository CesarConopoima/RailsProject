class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	PAYMENT_TYPES = [ "Deposito Bancario" , "Transferencia Bancaria"]
	SEND_TYPES = [ "MRW (Pago en destino)"]
	VENEZUELA_ESTADOS = [ "Anzoategui","Amazonas","Apure","Aragua","Barinas","Bolivar","Carabobo","Cojedes","Delta Amacuro","Distrito Capital","Falcon","Guarico","Lara","Merida","Miranda","Monagas","Nueva Esparta","Portuguesa","Tachira","Trujillo","Vargas","Yaracuy","Zulia"]
	STATUS = [ "Orden de compra recibida y en espera por pago para continuar el proceso de despacho" , "Comprobando datos del pago","Pago comprobado, productos embalados","Productos enviados, en espera por acuse de recibo"]
		BANCOS= ["Banco de Venezuela","Banesco",
		"BBVA Banco Provincial","Banco Mercantil",
		"Bicentenario Banco Universal",
		"Banco Occidental de Descuento BOD",
		"Bancaribe","Banco Exterior",
		"Banco del Tesoro",
		"Banco Industrial de Venezuela",
		"Banco Nacional de Credito BNC",
		"BFC","Venezolano de Credito",
		"Banco Caroni","Banco Agricola de Venezuela",
		"Banco Sofitasa","Banco Plaza","Del Sur",
		"Citibank","Banco Activo","Banplus",
		"100% Banco"]
	validates :nombre,:presence => { :message => "Este campo debe ser llenado" }, length: { maximum: 15 }
	validates :empresa,:presence => { :message => "Este campo debe ser llenado" }, length: { maximum: 30 }
	validates :direccion,:presence => { :message => "Este campo debe ser llenado" }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,:presence => { :message => "Este campo debe ser llenado" },format: { with: VALID_EMAIL_REGEX }
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

	def erase_not_processed_order
		Order.all.each do |order|
			time1 = order.updated_at
			time2 = Time.now()
			status = order.status
			if (time2 - time1) > 86400 and status.include?("Orden de compra recibida")
				order.destroy
			end 
		end 
	end
end
