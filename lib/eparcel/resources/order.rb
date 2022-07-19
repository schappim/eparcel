module Eparcel
  class OrderResource < Resource
    def get(order_id)
      Order.new(get_request("orders/#{order_id}").body, self)
    end

    def retrieve(order_id)
      Order.new(get_request("orders/#{order_id}").body, self)
    end

    def create_from_shipments(shipments: [], order_reference: "")
      body = {
        order_reference: order_reference,
        payment_method: "CHARGE_TO_ACCOUNT",
        shipments: shipments
      }
      Order.new(put_request("orders", body: body).body, self)
    end

    # Create shipments and order at the same time
    def create_with_shipments(shipments: [], order_reference: "")
      body = {
        order_reference: order_reference,
        payment_method: "CHARGE_TO_ACCOUNT",
        shipments: shipments
      }
      Order.new(put_request("orders", body: body).body, self)
    end

    def get_order_summary(order_id)
      get_request("accounts/#{@account_number}/orders/#{order_id}/summary").body
    end
  end
end
