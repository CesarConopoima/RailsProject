class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :producto
	belongs_to :cart

	def total_price
		producto.precio * quantity
	end
end
