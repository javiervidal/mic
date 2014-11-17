class Mic

  require 'csv'

  FILE = 'files/ISO10383.csv'

  class << self

    def where(options = {})
      include_segments = options[:include_segments] || false
      puts include_segments
      a = Mic::Search.new
      a = a.select_by(:mic, options[:mic], include_segments) if options[:mic]
      a = a.select_by(:operating_mic, options[:operating_mic], include_segments) if options[:operating_mic]
      a = a.select_by(:market_name, options[:market_name], include_segments) if options[:market_name]
      a = a.select_by(:country_code, options[:country_code], include_segments) if options[:country_code]
      a
    end

  end

end