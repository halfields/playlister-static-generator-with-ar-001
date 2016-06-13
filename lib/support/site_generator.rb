require 'pry'

class SiteGenerator

	def initialize(path)
		@path = path
	end

	def rendered_path
		@path
	end

	def build_index
		template = ERB.new(File.read("app/views/index.html.erb"))
		f = File.new(self.rendered_path + "/index.html")
		f.write(temmplate.result(binding))
		f.close
	end

	def build_artists_index
		template = ERB.new(File.read("app/views/artists/index.html.erb"))
		f = File.new(rendered_path + "/artists/index.html")
		f.write(template.result(binding))
		f.close
	end

	def build_artist_page
		Artist.all.each do |artist|
		template = ERB.new(File.read("app/views/artists/show.html.erb"))
		f = File.new(rendered_path + "/artists/#{artist.to_slug}.html")
		f.write(template.result(binding))
		f.close
	  end
	end

	def build_genres_index
		template = ERB.new(File.read("app/views/genres/index.html.erb"))
		f = File.new(rendered_path + "/genres/index.html")
		f.write(template.result(binding))
		f.close

	end

	def build_genre_page
		Genre.all.each do |genre|
		template = ERB.new(File.read("app/views/genres/show.html.erb"))
		f = File.new(rendered_path + "/genres/#{genre.to_slug}.html")
		f.write(template.result(binding))
		f.close
	  end
	end

	def build_songs_index
		template = ERB.new(File.read("app/views/songs/index.html.erb"))
		f = File.new(rendered_path + "/songs/index.html")
		f.write(template.result(binding))
		f.close
	end 

	def build_song_page
		Song.all.each do |song|
		template = ERB.new(File.read("app/views/songs/show.html.erb"))
		f = File.new(rendered_path + "/songs/#{song.to_slug}.html")
		f.write(template.result(binding))
		f.close
	  end
	end
end