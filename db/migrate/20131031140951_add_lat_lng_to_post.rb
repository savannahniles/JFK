class AddLatLngToPost < ActiveRecord::Migration
  def change
    add_column :posts, :latLng, :string
    add_column :posts, :origLatLng, :string
    remove_column :posts, :lat
    remove_column :posts, :long
    remove_column :posts, :originLat
    remove_column :posts, :originLong
  end
end
