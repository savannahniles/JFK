class Post < ActiveRecord::Base
	validates :lat,  presence: true
	validates :long,  presence: true
	validates :originLat,  presence: true
	validates :originLong,  presence: true
	validates :distanceTraveled,  presence: true
	validates :content, length: { maximum: 1200 }

	default_scope -> { order('created_at DESC') }
end
