class AddDateToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :fechadepago, :date
  end
end
