# frozen_string_literal: true

require_relative "eparcel/version"

module Eparcel
  class Error < StandardError; end
  # Your code goes here...

  autoload :Client, "eparcel/client"
  autoload :Error, "eparcel/error"
  autoload :Object, "eparcel/object"
  autoload :Resource, "eparcel/resource"

  # Resources
  autoload :AccountResource, "eparcel/resources/account"
  autoload :AdhocPickupResource, "eparcel/resources/adhoc_pickup"
  autoload :ClassificationResource, "eparcel/resources/classification"
  autoload :CombinedExportResource, "eparcel/resources/combined_export"
  autoload :DomesticShipmentResource, "eparcel/resources/domestic_shipment"
  autoload :EtaResource, "eparcel/resources/eta"
  autoload :InternationalShipmentResource, "eparcel/resources/international_shipment"
  autoload :LabelResource, "eparcel/resources/label"
  autoload :OrderResource, "eparcel/resources/order"
  autoload :PricesItemResource, "eparcel/resources/prices_item"
  autoload :PricesShipmentResource, "eparcel/resources/prices_shipment"
  autoload :ServiceabilityResource, "eparcel/resources/serviceability"
  autoload :ShipmentResource, "eparcel/resources/shipment"
  autoload :TrackingResource, "eparcel/resources/tracking"
  autoload :ValidateSuburbResource, "eparcel/resources/validate_suburb"
  autoload :ValidationResource, "eparcel/resources/validation"

  # Objects
  autoload :Account, "eparcel/objects/account"
  autoload :AdhocPickup, "eparcel/objects/adhoc_pickup"
  autoload :Classification, "eparcel/objects/classification"
  autoload :CombinedExport, "eparcel/objects/combined_export"
  autoload :DomesticShipment, "eparcel/objects/domestic_shipment"
  autoload :Eta, "eparcel/objects/eta"
  autoload :InternationalShipment, "eparcel/objects/international_shipment"
  autoload :Label, "eparcel/objects/label"
  autoload :Order, "eparcel/objects/order"
  autoload :PricesItem, "eparcel/objects/prices_item"
  autoload :PricesShipment, "eparcel/objects/prices_shipment"
  autoload :Serviceability, "eparcel/objects/serviceability"
  autoload :Shipment, "eparcel/objects/shipment"
  autoload :Tracking, "eparcel/objects/tracking"
  autoload :ValidateSuburb, "eparcel/objects/validate_suburb"
  autoload :Validation, "eparcel/objects/validation"
end
