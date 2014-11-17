class Mic

  class Search

    def initialize
      @a = []
      CSV.foreach(Mic::FILE) do |row|
        h = {}
        h[:mic] = row[2]
        h[:acronym] = row[6]
        h[:market_name] = row[5]
        h[:market_type] = row[4]
        h[:operating_mic] = row[3]
        h[:country_code] = row[1]
        h[:country_name] = row[0]
        h[:city] = row[7]
        h[:website] = row[8]
        @a << h
      end
    end

    def select_by(symbol, string)
      @a.select{ |m| m[symbol] =~ Regexp.new(string, 'i') }
    end

  end

end