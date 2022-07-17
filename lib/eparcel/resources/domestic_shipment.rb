module Eparcel
  class DomesticShipmentResource < Resource
    def get_dangerous_goods_form(shipment_id)
      get_request("shipments/#{shipment_id}/dangerous-goods-form").body
    end

    def get(shipment_id)
      DomesticShipment.new(get_request("shipments/#{shipment_id}").body, self)
    end

    def retrieve(shipment_id)
      DomesticShipment.new(get_request("shipments/#{shipment_id}").body, self)
    end

    def create(shipments)
      body = {shipments: shipments}
      DomesticShipment.new(post_request("shipments", body: body).body, self)
    end

    def validate(shipments)
      body = {shipments: shipments}
      DomesticShipment.new(post_request("shipments/validation", body: body).body, self)
    end

    def update(shipment_id, shipment)
      DomesticShipment.new(put_request("shipments/#{shipment_id}", body: shipment).body, self)
    end

    def destroy(shipment_id)
      DomesticShipment.new(delete_request("shipments/#{shipment_id}").body, self)
    end

    def destroy_item(shipment_id, item_id)
      DomesticShipment.new(delete_request("shipments/#{shipment_id}/items/#{item_id}").body, self)
    end
  end
end
