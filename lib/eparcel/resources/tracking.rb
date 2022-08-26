module Eparcel
  # This service retrieves information regarding the requestor’s charge account and the postage products that
  # the charge account is able to use.

  class TrackingResource < Resource
    def retrieve(tracking_ids: [])
      Tracking.new(get_request("track?tracking_ids=#{tracking_ids.join(",")}").body, self)
    end
  end
end
