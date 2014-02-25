class Change < ActiveRecord::Migration
  def change
  	 rename_column :productos, :imageUrl, :imageurl
  end
end
