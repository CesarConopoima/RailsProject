class AddDireccion2ToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :direccionaux, :text
    add_column :orders, :telefonoaux, :string
    add_column :orders, :tipoenvio, :string
    add_column :orders, :localidadvenezuela, :string
  end
end
