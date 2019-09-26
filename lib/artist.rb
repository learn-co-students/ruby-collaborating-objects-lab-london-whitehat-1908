class Artist
    @@all = []
    attr_accessor :name, :song
    def initialize(name)
        @name = name
        save
    end
    def self.all
        @@all
    end
    def add_song(song)
        song.artist=self
    end
    def songs
        Song.all.select {|song| song.artist == self}
    end
    def self.find_or_create_by_name(song)
        self.find(song) ? self.find(song) :self.new(song)
    end
    def self.find(name)
        self.all.find {|artist| artist.name == name}
    end
    def save
        @@all << self
    end
    def print_songs
        songs.each {|song| puts song.name}
    end
end