module Eparcel
  class ValidationResource < Resource
    def validate(details)
      Validation.new(post_request("shipments/validation", body: details).body, self)
    end
  end
end
