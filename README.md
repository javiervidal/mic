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

Markets can be found by mic, market_name and country_code:

    Mic.where(mic: 'XTSE')
    Mic.where(market_name: 'Toronto')
    Mic.where(country_code: 'CA')

By default, only operating markets are returned, but it is also possible to include market segments:

    Mic.where(mic: 'XNAS', include: :segments)
    Mic.where(country_code: 'PT', include: :segments)

## Contributing

1. Fork it ( http://github.com/<my-github-username>/mic/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2014 – ∞ Javier Vidal

## License

This gem is released under the [MIT License](http://opensource.org/licenses/MIT).