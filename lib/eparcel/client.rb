require "base64"
require "faraday"
require "faraday_middleware"

module Eparcel
  class Client
    attr_reader :account_number, :api_key, :api_password, :adapter, :authorization, :sandbox, :stubs

    def initialize(account_number:, api_key:, api_password:, adapter: Faraday.default_adapter, sandbox: false, partner_id:nil, stubs: nil)
      @account_number = account_number
      @api_key = api_key
      @api_password = api_password
      @partner_id = partner_id
      @adapter = adapter

      @base_uri = sandbox ? "https://digitalapi.auspost.com.au/shipping/v1/" : "https://digitalapi.auspost.com.au/shipping/v1/"

      @stubs = stubs
    end

    def account
      AccountResource.new(self)
    end

    def item_prices
      Eparcel::PricesItemResource.new(self)
    end

    def shipments
      Eparcel::ShipmentResource.new(self)
    end

    def adhoc_pickup
      Eparcel::AdhocPickupResource.new(self)
    end

    def classification
      Eparcel::ClassificationResource.new(self)
    end

    def combined_export
      Eparcel::CombinedExportResource.new(self)
    end

    def domestic_shipment
      Eparcel::DomesticShipmentResource.new(self)
    end

    def eta
      Eparcel::EtaResource.new(self)
    end

    def international_shipment
      Eparcel::InternationalShipmentResource.new(self)
    end

    def label
      Eparcel::LabelResource.new(self)
    end

    def order
      Eparcel::OrderResource.new(self)
    end

    def prices_item
      Eparcel::PricesItemResource.new(self)
    end

    def prices_shipment
      Eparcel::PricesShipmentResource.new(self)
    end

    def serviceability
      Eparcel::ServiceabilityResource.new(self)
    end

    def shipment
      Eparcel::ShipmentResource.new(self)
    end

    def tracking
      Eparcel::TrackingResource.new(self)
    end

    def validate_suburb
      Eparcel::ValidateSuburbResource.new(self)
    end

    def validation
      Eparcel::ValidationResource.new(self)
    end
    # def ping
    #   PingResource.new(self)
    # end

    # def quotes
    #   QuoteResource.new(self)
    # end

    # def products
    #   ProductResource.new(self)
    # end

    # def orders
    #   OrderResource.new(self)
    # end

    # def track
    #   TrackingResource.new(self)
    # end

    def connection
      @connection ||= Faraday.new(@base_uri) do |conn|
        conn.request :basic_auth, @api_key, @api_password
        conn.headers["Account-Number"] = @account_number
        conn.headers["AUSPOST-PARTNER-ID"] = @partner_id if @partner_id.present?
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter, @stubs
      end
    end
  end
end
