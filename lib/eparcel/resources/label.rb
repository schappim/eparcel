module Eparcel
  class LabelResource < Resource
    def get(request_id)
      Label.new(get_request("labels/#{request_id}").body, self)
    end

    def retrieve(request_id)
      Label.new(get_request("labels/#{request_id}").body, self)
    end

    def create(wait_for_label_url: false, unlabelled_articles_only: false, preferences: [], shipments: [])
      body = {
        wait_for_label_url: wait_for_label_url,
        unlabelled_articles_only: unlabelled_articles_only,
        preferences: preferences,
        shipments: shipments
      }
      Label.new(post_request("labels", body: body).body, self)
    end
  end
end
