require "json"

module Runaworld
  class Profile
    PROFILE_JSON = "#{File.dirname(__FILE__)}/../../config/profile.json"
    def self.print_profile
      profile = File.open(PROFILE_JSON) do |f|
        JSON.load(f)
      end
      puts "名前:#{profile["name"]}"
      puts "ふりがな:#{profile["phonetic"]}"
      puts "誕生日:#{profile["birthday"]}"
      puts "年齢:#{profile["age"]}"
      puts "あいさつ:#{profile["greeting"]}"
      puts "公式チャンネル:#{profile["channel"]}"
    end
  end
end
