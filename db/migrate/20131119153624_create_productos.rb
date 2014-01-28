class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :codigo
      t.string :marca
      t.integer :cantidad
      t.decimal :precio
      t.string :imageUrl
      t.string :modelo

      t.timestamps
    end
  end
end
