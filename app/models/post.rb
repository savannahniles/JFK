class Post < ActiveRecord::Base
	validates :lat,  presence: true
	validates :long,  presence: true
	validates :originLat,  presence: true
	validates :originLong,  presence: true
	validates :distanceTraveled,  presence: true
	validates :content, length: { maximum: 1200 }

	default_scope -> { order('created_at DESC') }


	def self.drift
		sample_number = Post.count/2.to_i
		posts = Post.all.sample(sample_number)

		posts.each do |post|
			post.drift
		end

	end

	def self.driftAll
		Post.all.each do |p|
			p.drift
		end
	end

	def drift(hours_since = -1)
		hours_since = time_ago(updated_at, "hours") if hours_since == -1
		if (hours_since >= 1)

			lat_change = (0.6 * hours_since)/69
			long_change = (0.6 * hours_since * Random.rand(3))/69


			if content.length % 2 == 0
				new_lat = lat + lat_change
			else
				new_lat = lat - lat_change
			end

			if time_ago(created_at, "seconds") % 2 == 0
				new_long = long + long_change
			else 
				new_long = long - long_change
			end

			d = get_distance(new_lat, new_long)

			update_attribute(:lat, new_lat)
			update_attribute(:long, new_long)
			update_attribute(:distanceTraveled, d)
			puts distanceTraveled

			save

		end

	end

	def tether
		update_attribute(:lat, originLat)
		update_attribute(:long, originLong)
		update_attribute(:distanceTraveled, 0.0)
		save
	end


	def time_ago(time, which) #returns time ago in hours
	    t = time.localtime
	    now = Time.now
	    
	    seconds_since = now.to_i - t.to_i

	    hours_since = seconds_since/60/60

	    return hours_since if which == "hours"
	    return seconds_since if which == "seconds"

	end#time ago

	def get_distance(new_lat, new_long)
		r = 6371 * 0.621371192 #convert to miles
		dLat = (new_lat-lat) * Math::PI / 180 
		dLon = (new_long-long) * Math::PI / 180 
		latOldR = lat * Math::PI / 180 
		latNewR = new_lat * Math::PI / 180 

		a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(latOldR) * Math.cos(latNewR)
		c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
		d = r * c;

		return d.round(1)
	end




end
