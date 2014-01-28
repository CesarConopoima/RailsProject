class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :nombre
      t.text :direccion
      t.string :email
      t.string :tipoPago

      t.timestamps
    end
  end
end
