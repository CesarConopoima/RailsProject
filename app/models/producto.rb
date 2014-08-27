class Producto < ActiveRecord::Base
	has_many :line_items
	has_many :orders, through: :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	attr_accessible :nombre, :codigo, :marca, :cantidad, :precio, :imageurl, :modelo,:flag1
	
	attr_accessible :imagenagregada
    has_attached_file :imagenagregada, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "logo/no_dispo.jpg"
    validates_attachment :imagenagregada,
  	:content_type => { :content_type => /jpg|gif|png|jpeg/},
  	:size => { :in => 0..800.kilobytes }

  	MISCELANEUS = [ "no", "si" ]

	validates :nombre, :codigo, :marca, :cantidad, :precio, :modelo, :imageurl, presence: true
	validates :precio, numericality: {greater_than_or_equal_to: 0.01}
	validates :codigo, uniqueness: true
	validates :imageurl, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)$}i,
		message: 'La imagen debe tener extension JPG,GIF o PNG'
		}

	def self.search(search)  
	     if search  
	      where('nombre LIKE ? OR codigo LIKE ? OR marca LIKE ?',"%#{search.upcase}%","%#{search.upcase}%","%#{search.downcase.capitalize}%").limit(10)  
	    else
	      where('imageurl NOT LIKE ?', "logo%").order("RANDOM()").limit(6)
	    end  
  	end 


  	def self.vista(marca,nombre)
  		where('marca LIKE ? AND nombre LIKE ?',"#{marca}","#{nombre}%")
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
