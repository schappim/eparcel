require "json"
module Eparcel
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get_request(url, params: {}, headers: {})
      # puts "\n\n"
      # puts "\n\n"
      # puts "==============================================="
      # puts "METHOD: GET"
      # puts "-----------------------------------------------"
      # puts "url: #{url}"
      # puts "-----------------------------------------------"
      # puts "headers: #{headers.to_json}"
      # puts "-----------------------------------------------"
      # puts "==============================================="
      # puts "\n\n"
      # puts "\n\n"

      handle_response client.connection.get(url, params, headers)
    end

    def post_request(url, body:, headers: {})

      # puts "\n\n"
      # puts "\n\n"
      # puts "==============================================="
      # puts "METHOD: POST"
      # puts "-----------------------------------------------"
      # puts "url: #{url}"
      # puts "-----------------------------------------------"
      # puts "headers: #{headers.to_json}"
      # puts "-----------------------------------------------"
      # puts "body:\n\n"
      # puts body.to_json
      # puts "==============================================="
      # puts "\n\n"
      # puts "\n\n"

      handle_response client.connection.post(url, body, headers)
    end

    def patch_request(url, body:, headers: {})
      # puts "\n\n"
      # puts "\n\n"
      # puts "==============================================="
      # puts "METHOD: PATCH"
      # puts "-----------------------------------------------"
      # puts "url: #{url}"
      # puts "-----------------------------------------------"
      # puts "headers: #{headers.to_json}"
      # puts "-----------------------------------------------"
      # puts "body:\n\n"
      # puts body.to_json
      # puts "==============================================="
      # puts "\n\n"
      # puts "\n\n"
      handle_response client.connection.patch(url, body, headers)
    end

    def put_request(url, body:, headers: {})
      # puts "\n\n"
      # puts "\n\n"
      # puts "==============================================="
      # puts "METHOD: PUT"
      # puts "-----------------------------------------------"
      # puts "url: #{url}"
      # puts "-----------------------------------------------"
      # puts "headers: #{headers.to_json}"
      # puts "-----------------------------------------------"
      # puts "body:\n\n"
      # puts body.to_json
      # puts "==============================================="
      # puts "\n\n"
      # puts "\n\n"
      handle_response client.connection.put(url, body, headers)
    end

    def delete_request(url, params: {}, headers: {})
      # puts "\n\n"
      # puts "\n\n"
      # puts "==============================================="
      # puts "METHOD: DELETE"
      # puts "-----------------------------------------------"
      # puts "url: #{url}"
      # puts "-----------------------------------------------"
      # puts "headers: #{headers.to_json}"
      # puts "-----------------------------------------------"
      # puts "==============================================="
      # puts "\n\n"
      # puts "\n\n"

      handle_response client.connection.delete(url, params, headers)
    end

    def handle_response(response)
      case response.status
      when 400
        raise Error, response.body["errors"].to_json
      when 401
        raise Error, response.body["errors"].to_json
      when 403
        raise Error, response.body["errors"].to_json
      when 404
        raise Error, response.body["errors"].to_json
      when 429
        raise Error, response.body["errors"].to_json
      when 500
        raise Error, response.body["errors"].to_json
      when 503
        raise Error, response.body["errors"].to_json
      end
      
      # puts response.body.to_json

      response
    end
  end
end
