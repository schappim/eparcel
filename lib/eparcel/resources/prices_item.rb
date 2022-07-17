module Eparcel
  class PricesItemResource < Resource
    def get_price(from_postcode, to_postcode, items)
      body = {
        from: {
          postcode: from_postcode.to_s
        },
        to: {
          postcode: to_postcode.to_s
        },
        items: items
      }
      PricesItem.new(post_request("prices/items", body: body).body, self)
    end
  end
end
