class Mic

  require 'csv'

  FILE = 'files/ISO10383.csv'

  class << self

    def where(options = {})
      include_segments = options[:include_segments] || false
      a = Mic::Search.new
      a = a.select_by_mic(options[:mic]) if options[:mic]
    end

  end

end