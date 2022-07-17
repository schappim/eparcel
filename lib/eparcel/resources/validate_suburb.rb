module Eparcel
  class ValidateSuburbResource < Resource
    def validate(suburb, state, postcode)
      ValidateSuburb.new(get_request("address?suburb=#{suburb}&state=#{state}&postcode=#{postcode}").body, self)
    end
  end
end
