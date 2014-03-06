class Producto < ActiveRecord::Base
	has_many :line_items
	has_many :orders, through: :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	attr_accessible :nombre, :codigo, :marca, :cantidad, :precio, :imageurl, :modelo
	
	validates :nombre, :codigo, :marca, :cantidad, :precio, :modelo, :imageurl, presence: true
	validates :precio, numericality: {greater_than_or_equal_to: 0.01}
	validates :codigo, uniqueness: true
	validates :imageurl, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)$}i,
		message: 'La imagen debe tener extension JPG,GIF o PNG'
		}

	def self.search(search)  
	    if search  
	      find_by_sql("select * from productos where codigo like '%#{search}%' " )
	    if search == nil
	   	   find_by_sql("select * from productos where imageurl not like 'logo%' ORDER BY RANDOM() LIMIT 10 ") 	
	    else
	      find_by_sql("select * from productos where imageurl not like 'logo%' ORDER BY RANDOM() LIMIT 10 ")
	    end  
  	end 

  	def self.marcas
  		 find_by_sql("select marca from productos group by marca")
  	end

  	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items presente')
			return false
		end
	end
end
