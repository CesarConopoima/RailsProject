class AddFlag1ToProductos < ActiveRecord::Migration
  def change
    add_column :productos, :flag1, :string, default: "no"
  end
end
