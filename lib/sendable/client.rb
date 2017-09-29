require 'net/http'
require 'uri'
require 'json'

module Sendable
  class Client
    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def render(params = {})
      uri = URI('https://api.sendable.io/v1/render')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.request_uri)
      request.basic_auth(api_key, '')
      request.body = params.respond_to?(:to_json) ? params.to_json : JSON.dump(params)
      response = http.request(request)

      JSON.parse(response.body)
    end

    def email(params = {})
      uri = URI('https://api.sendable.io/v1/email')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.request_uri)
      request.basic_auth(api_key, '')
      request.body = params.respond_to?(:to_json) ? params.to_json : JSON.dump(params)
      response = http.request(request)

      JSON.parse(response.body)
    end
  end
end
