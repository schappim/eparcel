module Eparcel
  class EtaResource < Resource
    def get(from:, to:, despatch_date:, product_ids: [])
      body = {
        from: from,
        to: to,
        despatch_date: despatch_date,
        product_ids: product_ids
      }
      Eta.new(post_request("estimated_time_arrival", body: body).body, self)
    end
  end
end
