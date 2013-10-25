class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.float :lat
      t.float :long
      t.float :originLat
      t.float :originLong
      t.float :distanceTraveled

      t.timestamps
    end
  end
end
