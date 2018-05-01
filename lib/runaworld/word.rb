require "json"
module Runaworld
  class Word
    WORD_JSON = "config/word.json"
    def self.print_random_word
      words = read_file
      puts words["word"].sample
    end

    def self.print_all_word
      words = read_file
      puts words["word"]
    end

    private
    def self.read_file
      files = File.open(WORD_JSON) do |f|
        JSON.load(f)
      end
      return files
    end
  end
end

