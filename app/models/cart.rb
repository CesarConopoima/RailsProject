class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def total_price
		line_items.to_a.sum {|item| item.total_price}
	end

	def add_producto(producto_id,quantity)
		current_item = line_items.find_by_producto_id(producto_id)
		if current_item
			current_item.quantity += quantity
		else
			current_item = line_items.build(producto_id: producto_id)
			current_item.quantity += quantity - 1
		end
			current_item
	end

	def decrease(line_item_id)
	    current_item = line_items.find(line_item_id)
	    if current_item.quantity > 1
	      current_item.quantity -= 1
	    else
	      current_item.destroy
	    end
	    current_item
	end

  def increase(line_item_id)
    current_item = line_items.find(line_item_id)
    current_item.quantity += 10
    current_item
  end

  def increase1(line_item_id)
    current_item = line_items.find(line_item_id)
    current_item.quantity += 1
    current_item
  end

  def erase(line_item_id)
	current_item = line_items.find(line_item_id)
	current_item.destroy
	current_item
  end
  
end
