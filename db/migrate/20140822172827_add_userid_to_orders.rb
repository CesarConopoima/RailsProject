class AddUseridToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :userid, :integer
    add_column :orders, :status, :string
  end
end
