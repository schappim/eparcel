module Eparcel
  class InternationalShipmentResource < Resource
    def get_dangerous_goods_form(shipment_id)
      get_request("shipments/#{shipment_id}/dangerous-goods-form").body
    end

    def get(shipment_id)
      InternationalShipment.new(get_request("shipments/#{shipment_id}").body, self)
    end

    def retrieve(shipment_id)
      InternationalShipment.new(get_request("shipments/#{shipment_id}").body, self)
    end

    def create(shipments)
      body = {shipments: shipments}
      InternationalShipment.new(post_request("shipments", body: body).body, self)
    end

    def validate(shipments)
      body = {shipments: shipments}
      InternationalShipment.new(post_request("shipments/validation", body: body).body, self)
    end

    def update(shipment_id, shipment)
      InternationalShipment.new(put_request("shipments/#{shipment_id}", body: shipment).body, self)
    end

    def destroy(shipment_id)
      InternationalShipment.new(delete_request("shipments/#{shipment_id}").body, self)
    end

    def destroy_item(shipment_id, item_id)
      InternationalShipment.new(delete_request("shipments/#{shipment_id}/items/#{item_id}").body, self)
    end
  end
end
