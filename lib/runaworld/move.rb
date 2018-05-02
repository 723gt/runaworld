require "nokogiri"
require "open-uri"

module Runaworld
  class Move
    URL = "https://www.youtube.com/channel/UCQYADFw7xEJ9oZSM5ZbqyBw/videos"
    class << self
      def get_move_list
        move_list = scraping_channel
        move_list.each_with_index do |m,i|
          print_info(i, m[:title], m[:link])
        end
      end

      def get_move(in_no)
        move = get_move_array(in_no)
        begin
          print_info(in_no - 1 , move[:title], move[:link])
        rescue => e
          print_error
        end
      end

      def get_move_url(in_no)
        move = get_move_array(in_no)
        begin 
          puts "https://www.youtube.com#{move[:link]}"
        rescue => e
          print_error
        end
      end

      def get_move_title(in_no)
        move = get_move_array(in_no)
        begin
          puts "#{move[:title]}"
        rescue => e
          print_error
        end
      end

      def get_move_latest
        move_list = scraping_channel
        move_no = move_list.length - 1
        move_latest = move_list.last
        print_info(move_no, move_latest[:title], move_latest[:link])
      end

      private
      def get_move_array(in_no)
        move_no = in_no - 1
        move_list = scraping_channel
        return move_list[move_no]
      end

      def scraping_channel
        charset = nil

        html = open(URL) do |f|
          charset = f.charset
          f.read
        end

        doc = Nokogiri::HTML.parse(html, nil, charset)
        move_array = Array.new
        doc.css('a.yt-uix-sessionlink.yt-uix-tile-link.spf-link.yt-ui-ellipsis.yt-ui-ellipsis-2').each do |t|
          move_array << {:title => t[:title], :link => t[:href]}
        end
        move_array.reverse!
        return move_array
      end

      def print_info(no, title, link)
        puts "No.#{no + 1}"
        puts "タイトル: #{title}"
        puts "url:https://www.youtube.com#{link}"
      end

      def print_error
        STDERR.puts "それエラーやないかーい"
      end
    end
  end
end
