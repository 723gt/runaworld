require 'thor'
module Runaworld
  class  Cli < Thor
    desc "profile", "print profile of kaguya runa"
    def profile
      Runaworld::Profile.print_profile       
    end

    desc "word [all]", "print wordbook of kaguya runa"
    def word(type = nil)
      case type
      when 'all'
        Runaworld::Word.print_all_word
      when nil
        Runaworld::Word.print_random_word
      else
        STDERR.puts "argment error"
      end
    end

    desc "move_list", "print Move title and URL"
    def move_list
      Runaworld::Move.get_move_list
    end

    desc "move [NO]", "print each move info"
    def move(no = 1)
      Runaworld::Move.get_move(no.to_i)
    end
  end
end

