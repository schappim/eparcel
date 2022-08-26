module Eparcel
  class DomesticShipment < Object
     def items
      self.shipments.first.items
    end
  end
end
