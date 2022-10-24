# eParcel Ruby Gem

This is a Ruby wrapper for the Australia Post eParcel API.

The wrapper is based on Australia Post's [Shipping and Tracking APIs](https://developers.auspost.com.au/docs/reference).

This project is not affiliated with Australia Post.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eparcel'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install eparcel

## Usage

### Configuration
    


#### Authentication
```ruby
client = Eparcel::Client.new(account_number: 00000000001, api_key: 'API KEY', api_password: 'YOUR PASSWORD', sandbox: true)
```

#### Fetch Shipments
```ruby
response = client.retrieve(number_of_shipments: 370, status: ['Created'])
shipments = shipments_response.shipments
```

#### Create Domestic Shipment
```ruby
# create shipment client
eparcel_shipment_client = client.domestic_shipment

# Delivery Address
address = {}
address["name"] = "JOHN SMITH"
address["business_name"] = "AUSPOST"
address["lines"]["1 George Street"] # array up to 4 lines
address["suburb"] = "SYDNEY"
address["state"] = "NSW"
address["postcode"] = "2000"
address["phone"] = "1300000000"

item = {}

item["item_reference"] = 'My Item Reference' # your reference for the article
item["product_id"] = 'J131' # eParcel Product Code
item["length"] = 10 # length in cm
item["width"] = 10 # length in cm
item["height"] = 10 # length in cm
item["weight"] = 1.2 # weight in kg


# Create the shipment object
shipment = {
	shipment_reference: "Shipment Reference",
	customer_reference_1: "Ref 1",
	customer_reference_2: "Ref 2",
	email_tracking_enabled: false
	to: address, 
    from: address,
	items: [item]
}

# Ask Australia Post to create the shipment from the shipment object. 
@shipments = @eparcel_shipment.create([shipment])
```

#### Cancel Shipment
```ruby
# cancel a shipment that has been created with Australia Post
response = @shipments_client.destroy('SHIPMENTID')
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/schappim/eparcel.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
