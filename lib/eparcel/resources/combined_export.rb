module Eparcel
  class CombinedExportResource < Resource
    def retrieve(destination_country, shipping_value, postcode, products)
      body = {
        destination_country: destination_country,
        shipping_value: shipping_value,
        postcode: postcode.to_s,
        products: products
      }

      CombinedExport.new(post_request("export-tools/classifications", body: body).body, self)
    end
  end
end
