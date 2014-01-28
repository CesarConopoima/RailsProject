class AddEmpresaAndTelefonoToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :empresa, :text

    add_column :orders, :telefono, :string

  end
end
