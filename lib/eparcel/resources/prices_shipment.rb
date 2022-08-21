module Eparcel
  class PricesShipmentResource < Resource
    # This service retrieves shipment level pricing based upon the merchant location address,
    # destination, and details of the parcel product selected. For convenience, the service
    # is compatible with the Create Shipment service and accepts the same field details,
    # The calculated price is related to your available postage products and contract rates.

    def get_price(shipments)
      body = {shipments: shipments}
      PricesShipment.new(post_request("prices/shipments", body: body.to_json).body, self)
    end
  end
end
