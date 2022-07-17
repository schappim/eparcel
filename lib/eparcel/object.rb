require "ostruct"

module Eparcel
  class Object < OpenStruct
    attr_reader :resource

    def initialize(attributes, resource = nil)
      super to_ostruct(attributes)
      @resource = resource
    end

    def to_ostruct(obj)
      if obj.is_a?(Hash)
        OpenStruct.new(obj.map { |key, val| [key, to_ostruct(val)] }.to_h)
      elsif obj.is_a?(Array)
        obj.map { |o| to_ostruct(o) }
      else # Assumed to be a primitive value
        obj
      end
    end
  end
end
