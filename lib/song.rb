class Song
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.new_by_filename(filename)
        artist_name, name = filename.split('.').first.split(' - ')
        song = self.new(name)
        song.artist_name = artist_name
        song.artist.add_song(song)
        song
    end

    def artist
        @artist
    end

    def artist=(a)
        a.songs << self
        @artist = a
    end

    def self.all
        @@all
    end

    def artist_name
        @artist.name if @artist
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
    end
end