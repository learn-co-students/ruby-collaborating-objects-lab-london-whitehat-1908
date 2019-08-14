class Song
    attr_accessor :artist, :name
    @@all = []


    def initialize (name)
        @name = name
        @@all << self  
    end

    def self.all
      @@all
    end

    def self.new_by_filename(filename)
        artist, song = filename.split(".").first.split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end


