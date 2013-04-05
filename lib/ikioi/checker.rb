require "json"
require "open-uri"

module Ikioi
  class Checker

    attr_reader :keyword, :board_name

    def initialize(keyword, board_name)
      @keyword = keyword
      @board_name = board_name
    end

    def fetch
      @last_ikioi = parse(fetch_jsonp).find {|item| item['title'].include?(keyword) }['ikioi']
    rescue OpenURI::HTTPError => e
      @last_ikioi
    end

    def parse(jsonp)
      JSON.parse(jsonp.sub('callback(', '').sub(/\);$/, ''))
    end

    def fetch_jsonp
      open("http://2ch-ranking.net/ranking.json?board=#{board_name}").read
    end

  end
end
