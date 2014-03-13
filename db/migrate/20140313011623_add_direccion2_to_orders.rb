class AddDireccion2ToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :direccion2, :text
    add_column :orders, :telefono2, :string
    add_column :orders, :tipoenvio, :string
    add_column :orders, :localidadvenezuela, :string
  end
end
