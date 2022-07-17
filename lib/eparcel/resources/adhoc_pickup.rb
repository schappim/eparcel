module Eparcel
  class AdhocPickupResource < Resource
    def retrieve(booking_id)
      AdhocPickup.new(get_request("pickups/adhoc/#{booking_id}").body, self)
    end

    def create(details)
      AdhocPickup.new(post_request("pickups/adhoc", body: details).body, self)
    end
  end
end
