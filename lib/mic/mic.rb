class Mic

  require 'csv'

  FILE = 'files/ISO10383.csv'

  class << self

    def where(options = {})
      include_segments = options[:include_segments] || false
      a = Mic::Search.new
      a = a.select_by(:mic, options[:mic]) if options[:mic]
      a = a.select_by(:market_name, options[:market_name]) if options[:market_name]
      a = a.select_by(:country_code, options[:country_code]) if options[:country_code]
      a
    end

  end

end