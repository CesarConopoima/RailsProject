class AddNombreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nombre, :string
	add_column :users, :apellido, :string
    add_column :users, :nombreEmpresa, :string
    add_column :users, :rifEmpresa, :string
    add_column :users, :direccion, :text
    add_column :users, :codigoPostal, :string
    add_column :users, :estado, :string
    add_column :users, :telefono, :string
    add_column :users, :localidadVenezuela, :string
  end
end
