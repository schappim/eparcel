module Eparcel
  # This service retrieves information regarding the requestor’s charge account and the postage products that
  # the charge account is able to use.

  class AccountResource < Resource
    def retrieve(account_number)
      Account.new(get_request("accounts/#{account_number}").body, self)
    end
  end
end
