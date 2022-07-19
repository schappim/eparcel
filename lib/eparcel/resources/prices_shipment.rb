module Eparcel
  class PricesShipmentResource < Resource
    # This service retrieves shipment level pricing based upon the merchant location address,
    # destination, and details of the parcel product selected. For convenience, the service
    # is compatible with the Create Shipment service and accepts the same field details,
    # The calculated price is related to your available postage products and contract rates.

    def get_price(from, to, items)
      body = {
        from: from,
        to: to,
        items: items
      }
      PricesShipment.new(post_request("prices/items", body: body.to_json).body, self)
    end
  end
end
