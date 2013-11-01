class AddLatToPost < ActiveRecord::Migration
  def change
    add_column :posts, :lat, :float
    add_column :posts, :long, :float
    add_column :posts, :originLat, :float
    add_column :posts, :originLong, :float
    remove_column :posts, :latLng
    remove_column :posts, :origLatLng
  end
end
