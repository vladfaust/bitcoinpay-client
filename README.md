# Bitcoinpay

Bitcoinpay.com API client for Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitcoinpay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitcoinpay

## Usage

It's so easy:

```ruby
require 'bitcoinpay'

client = Bitcoinpay::Client.new(ENV['BITCOINPAY_API_KEY'])
# => #<Bitcoinpay::Client:0x0055bfeac145d0 @api_key="nUISn79Sndsa36f64L">

client.get_rate('USD')
# => 659.62

client.get_payment(payment_id: 42)
# => {"detail"=>{"id"=>["Invoice does not exist"]}}

client.create_new_payment_request
# => {"detail"=>{"currency"=>["This field is required."], "price"=>["This field is required."], "settled_currency"=>["This field is required."], "reference"=>["This field is required."], "error"=>"Please reffer to API documentation http://docs.bitcoinpaycom.apiary.io/#create-payment"}}
# f**k
```

## Development

Blah blah.

## Contributing

Blah blah too, but pull requests welcome!


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
