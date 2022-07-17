module Eparcel
  # This service retrieves information regarding the requestor’s charge account and the postage products that
  # the charge account is able to use.

  class ServiceabilityResource < Resource
    def retrieve(product_id:, from:, to:)
      body = [
        {
          product_id: product_id,
          from: from,
          to: to
        }
      ]
      Serviceability.new(post_request("serviceability/lookup", body: body).body, self)
    end
  end
end
