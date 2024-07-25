module Eparcel
  class DomesticShipmentResource < Resource
  
    def list
      DomesticShipment.new(get_request("shipments").body, self)
    end

    def get(item_id)
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
      # DomesticShipment.new(delete_request("shipments/#{shipment_id}").body, self)
      response = delete_request("shipments/#{shipment_id}")
      unless response.is_a?(Hash)
        Rails.logger.error("Expected a Hash but received #{response.class}: #{response.inspect}")
        response = {}
      end

      DomesticShipment.new(response, self)
    end

    def destroy_item(shipment_id, item_id)
      DomesticShipment.new(delete_request("shipments/#{shipment_id}/items/#{item_id}").body, self)
    end

    def update_item(shipment_id, item)
      body = {items: item}
      DomesticShipment.new(put_request("shipments/#{shipment_id}/items", body: body).body, self)
    end

  end
end
