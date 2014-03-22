class AddAttachmentImagenagregadaToProductos < ActiveRecord::Migration
  def self.up
    change_table :productos do |t|
      t.attachment :imagenagregada
    end
  end

  def self.down
    drop_attached_file :productos, :imagenagregada
  end
end
