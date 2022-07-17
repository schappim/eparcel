module Eparcel
  class ClassificationResource < Resource
    def retrieve(item_description)
      Classification.new(post_request("export-tools/classifications", body: {item_description: item_description}).body, self)
    end
  end
end
