require "active_support"
require "open-uri"

module Ikioi
  class Checker

    def initialize(keyword)
      @keyword = keyword
    end

    def keyword
      @keyword
    end

    def fetch
      @last_ikioi = parse(fetch_jsonp).find {|item| item['title'].include?(keyword) }['ikioi']
    rescue OpenURI::HTTPError => e
      @last_ikioi
    end

    def parse(jsonp)
      ActiveSupport::JSON.decode(jsonp.sub('callback(', '').sub(/\);$/, ''))
    end

    def fetch_jsonp
      open('http://2ch-ranking.net/ranking.json?board=gameswf').read
    end

  end
end
