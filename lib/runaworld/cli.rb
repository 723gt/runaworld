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

    desc "move ['title' or 'url' or 'list' or 'latest' or  NO] [NO]", "print each move info,is title and URL"
    def move(mode = 1, no = 1)
      case mode
      when /^[0-9]+$/
        no = mode
        Runaworld::Move.get_move(no.to_i)
      when 'url'
        Runaworld::Move.get_move_url(no.to_i)
      when 'title'
        Runaworld::Move.get_move_title(no.to_i)
      when 'list'
        Runaworld::Move.get_move_list
      when 'latest'
        Runaworld::Move.get_move_latest
      else
        Runaworld::Move.get_move_list
      end
    end
  end
end
