module Eparcel
  # This service retrieves information regarding the requestor’s charge account and the postage products that
  # the charge account is able to use.

  class ShipmentResource < Resource
    def retrieve(shipment_ids: [], offset: 0, number_of_shipments: 10, status: [], despatch_date: nil, sender_reference: nil)
      url_params = ""
      url_params = "#{url_params}shipment_ids=#{shipment_ids.join(",")}" unless shipment_ids.empty?
      url_params = "#{url_params}&offset=#{offset}" unless offset.nil?
      url_params = "#{url_params}&number_of_shipments=#{number_of_shipments}" unless number_of_shipments.nil?
      url_params = "#{url_params}&status=#{status.join(",")}" unless status.empty?
      url_params = "#{url_params}&despatch_date=#{despatch_date}" unless despatch_date.nil?
      url_params = "#{url_params}&sender_reference=#{sender_reference}" unless sender_reference.nil?
      Shipment.new(get_request("shipments?#{url_params}").body, self)
    end

    def validate(details)
      Validation.new(post_request("shipments/validation", body: details).body, self)
    end
  end
end
