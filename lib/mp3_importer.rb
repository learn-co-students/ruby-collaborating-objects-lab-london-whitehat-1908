require_relative './song.rb'

class MP3Importer
    attr_reader :path
    def initialize(path)
        @path = path
    end

    def files
        Dir[@path+'/*.mp3'].select { |file| file.match(/\.mp3/)  }
                          .map    { |file| file.split('/').last }
    end

    def import
        files.each { |file| Song.new_by_filename(file) }
    end
end