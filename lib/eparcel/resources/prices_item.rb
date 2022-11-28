module Eparcel
  class PricesItemResource < Resource
    def get_price(from_postcode, to_postcode, country='AU', items)
      body = {
        from: {
          postcode: from_postcode.to_s
        },
        to: {
          postcode: to_postcode.to_s,
          country: country
        },
        items: items
      }
      PricesItem.new(post_request("prices/items", body: body).body, self)
    end
  end
end
