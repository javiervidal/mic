# Mic

ISO 10383 - Market Identifier Codes (MIC).

The ISO 10383 specifies a universal method of identifying exchanges, trading platforms, regulated or non-regulated
markets and trade reporting facilities as sources of prices and related information in order to facilitate automated
processing.

This gem provides the market codes, the market names and most of the fields defined in the ISO 10383.

## Installation

Add this line to your application's Gemfile:

    gem 'mic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mic

## Usage

Each market has the following attributes:
* mic: Market Identifier Code allocated to the market
* acronym: known acronym of the market
* market_name: name of the market
* market_type: O (Operating) or S (Segment) indicating whether the MIC is an operating MIC or a market segment MIC
* operating_mic: MIC representing the market at operating level
* country_code: ISO country code (ISO 3166-1 alpha-2) of the country where the market is registered
* country_name: country where the market is registered
* city: city where the market is located
* website: website of the market

Markets can be found by mic, operating_mic, market_name and country_code. Searches are case insensitive.

```ruby
> Mic.where(mic: 'XTSE')
  [
    {:mic=>"XTSE", :acronym=>"TSX", :market_name=>"TORONTO STOCK EXCHANGE", :market_type=>"O", :operating_mic=>"XTSE", :country_code=>"CA", :country_name=>"CANADA", :city=>"TORONTO", :website=>"WWW.TSE.COM"}
  ]
```

```ruby
> Mic.where(market_name: 'Toronto')
  [
    {:mic=>"XTSE", :acronym=>"TSX", :market_name=>"TORONTO STOCK EXCHANGE", :market_type=>"O", :operating_mic=>"XTSE", :country_code=>"CA", :country_name=>"CANADA", :city=>"TORONTO", :website=>"WWW.TSE.COM"}
  ]
```

```ruby
> Mic.where(country_code: 'DK')
  [
    {:mic=>"DKTC", :acronym=>nil, :market_name=>"DANSK OTC", :market_type=>"O", :operating_mic=>"DKTC", :country_code=>"DK", :country_name=>"DENMARK", :city=>"HORSENS", :website=>"WWW.DANSKOTC.DK"},
    {:mic=>"GXGR", :acronym=>"DANSK AMP", :market_name=>"GXG MARKETS A/S", :market_type=>"O", :operating_mic=>"GXGR", :country_code=>"DK", :country_name=>"DENMARK", :city=>"HORSENS", :website=>"WWW.GXGMARKETS.COM"},
    {:mic=>"NPGA", :acronym=>nil, :market_name=>"NORD POOL GAS A/S", :market_type=>"O", :operating_mic=>"NPGA", :country_code=>"DK", :country_name=>"DENMARK", :city=>"COPENHAGEN", :website=>"WWW.NORDPOOLGAS.COM"},
    {:mic=>"XCSE", :acronym=>nil, :market_name=>"OMX NORDIC EXCHANGE COPENHAGEN A/S", :market_type=>"O", :operating_mic=>"XCSE", :country_code=>"DK", :country_name=>"DENMARK", :city=>"COPENHAGEN", :website=>"WWW.OMXNORDICEXCHANGE.COM"}
  ]
```

By default, only operating markets are returned, but it is also possible to include market segments:

```ruby
> Mic.where(country_code: 'DK', include_segments: true)
  [
    {:mic=>"DKTC", :acronym=>nil, :market_name=>"DANSK OTC", :market_type=>"O", :operating_mic=>"DKTC", :country_code=>"DK", :country_name=>"DENMARK", :city=>"HORSENS", :website=>"WWW.DANSKOTC.DK"},
    {:mic=>"GXGR", :acronym=>"DANSK AMP", :market_name=>"GXG MARKETS A/S", :market_type=>"O", :operating_mic=>"GXGR", :country_code=>"DK", :country_name=>"DENMARK", :city=>"HORSENS", :website=>"WWW.GXGMARKETS.COM"},
    {:mic=>"GXGF", :acronym=>nil, :market_name=>"GXG MTF FIRST QUOTE", :market_type=>"S", :operating_mic=>"GXGR", :country_code=>"DK", :country_name=>"DENMARK", :city=>"HORSENS", :website=>"WWW.GXGMARKETS.COM"},
    {:mic=>"GXGM", :acronym=>nil, :market_name=>"GXG MTF", :market_type=>"S", :operating_mic=>"GXGR", :country_code=>"DK", :country_name=>"DENMARK", :city=>"HORSENS", :website=>"WWW.GXGMARKETS.COM"},
    {:mic=>"NPGA", :acronym=>nil, :market_name=>"NORD POOL GAS A/S", :market_type=>"O", :operating_mic=>"NPGA", :country_code=>"DK", :country_name=>"DENMARK", :city=>"COPENHAGEN", :website=>"WWW.NORDPOOLGAS.COM"},
    {:mic=>"XCSE", :acronym=>nil, :market_name=>"OMX NORDIC EXCHANGE COPENHAGEN A/S", :market_type=>"O", :operating_mic=>"XCSE", :country_code=>"DK", :country_name=>"DENMARK", :city=>"COPENHAGEN", :website=>"WWW.OMXNORDICEXCHANGE.COM"},
    {:mic=>"XFND", :acronym=>nil, :market_name=>"FIRST NORTH DENMARK", :market_type=>"S", :operating_mic=>"XCSE", :country_code=>"DK", :country_name=>"DENMARK", :city=>"COPENHAGEN", :website=>"WWW.OMXNORDICEXCHANGE.COM"}
  ]
```

```ruby
> Mic.where(operating_mic: 'XNAS', include_segments: true)
  [
    {:mic=>"XNAS", :acronym=>"NASDAQ", :market_name=>"NASDAQ - ALL MARKETS", :market_type=>"O", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQ.COM"},
    {:mic=>"BOSD", :acronym=>"NQBXDARK", :market_name=>"NASDAQ OMX BX DARK", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQOMXTRADER.COM"},
    {:mic=>"ESPD", :acronym=>"ESPEED", :market_name=>"NASDAQ OMX ESPEED", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQOMX.COM"},
    {:mic=>"NASD", :acronym=>"NSDQDARK", :market_name=>"NSDQ DARK", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQ.COM"},
    {:mic=>"XBOS", :acronym=>"BSE", :market_name=>"NASDAQ OMX BX", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQOMXTRADER.COM"},
    {:mic=>"XBRT", :acronym=>"BRUT", :market_name=>"BRUT ECN", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQTRADER.COM"},
    {:mic=>"XBXO", :acronym=>nil, :market_name=>"NASDAQ OMX BX OPTIONS", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQOMXTRADER.COM"},
    {:mic=>"XNCM", :acronym=>nil, :market_name=>"NASDAQ CAPITAL MARKET", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQ.COM"},
    {:mic=>"XNDQ", :acronym=>nil, :market_name=>"NASDAQ OPTIONS MARKET", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQ.COM"},
    {:mic=>"XNGS", :acronym=>"NGS", :market_name=>"NASDAQ/NGS (GLOBAL SELECT MARKET)", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQ.COM"},
    {:mic=>"XNIM", :acronym=>nil, :market_name=>"NASDAQ INTERMARKET", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQ.COM"},
    {:mic=>"XNMS", :acronym=>nil, :market_name=>"NASDAQ/NMS (GLOBAL MARKET)", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQ.COM"},
    {:mic=>"XPBT", :acronym=>"NFX", :market_name=>"NASDAQ OMX FUTURES EXCHANGE", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"PHILADELPHIA", :website=>"WWW.NASDAQTRADER.COM"},
    {:mic=>"XPHL", :acronym=>"PHLX", :market_name=>"NASDAQ OMX PHLX", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"PHILADELPHIA", :website=>"WWW.PHLX.COM"},
    {:mic=>"XPHO", :acronym=>nil, :market_name=>"PHILADELPHIA OPTIONS EXCHANGE", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"PHILADELPHIA", :website=>"WWW.PHLX.COM"},
    {:mic=>"XPOR", :acronym=>nil, :market_name=>"PORTAL", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"WASHINGTON", :website=>"WWW.NASDAQPORTALMARKET.COM"},
    {:mic=>"XPSX", :acronym=>"PSX", :market_name=>"NASDAQ OMX PSX", :market_type=>"S", :operating_mic=>"XNAS", :country_code=>"US", :country_name=>"UNITED STATES OF AMERICA", :city=>"NEW YORK", :website=>"WWW.NASDAQTRADER.COM"}
  ]
```

## Contributing

1. Fork it ( http://github.com/javiervidal/mic/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Code Status

[![Gem Version](http://img.shields.io/badge/gem-v1.0.1-blue.svg)](https://rubygems.org/gems/mic)
[![Build Status](https://travis-ci.org/javiervidal/mic.svg?branch=master)](https://travis-ci.org/javiervidal/mic)
[![Coverage Status](https://coveralls.io/repos/javiervidal/mic/badge.png?branch=master)](https://coveralls.io/r/javiervidal/mic?branch=master)
[![Code Climate](https://codeclimate.com/github/javiervidal/mic/badges/gpa.svg)](https://codeclimate.com/github/javiervidal/mic)

## Copyright

Copyright (c) 2014 – ∞ Javier Vidal

## License

This gem is released under the [MIT License](http://opensource.org/licenses/MIT).