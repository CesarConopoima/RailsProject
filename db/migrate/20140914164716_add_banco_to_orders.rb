class AddBancoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :banco, :string
    add_column :orders, :numerodepago, :string
    add_column :orders, :monto, :string
  end
end
