class Artist
    @@all = []

    attr_accessor :name, :songs

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def print_songs
        @songs.each { |song| puts song.name }
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        artist = self.all.find { |artist| artist.name == name }
        if artist
            artist
        else
            Artist.new(name)
        end
    end
end