require 'net/http'
require 'uri'
require 'json'

module Sendable
  class Client
    attr_reader :project_id
    attr_reader :api_key

    def initialize(project_id, api_key)
      @project_id = project_id
      @api_key = api_key
    end

    def render(template_id, params = {})
      uri = URI("https://api.sendable.io/v1/project/#{project_id}/template/#{template_id}/render")

      headers = {
        'Authorization': "ApiKey #{api_key}",
        'Content-Type' => 'application/json',
      }

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.request_uri, headers)
      request.body = JSON.dump(params)
      response = http.request(request)

      JSON.parse(response.body)
    end

    def email(template_id, params = {})
      uri = URI("https://api.sendable.io/v1/project/#{project_id}/template/#{template_id}/email")

      headers = {
        'Authorization': "ApiKey #{api_key}",
        'Content-Type' => 'application/json',
      }

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.request_uri, headers)
      request.body = JSON.dump(params)
      response = http.request(request)

      JSON.parse(response.body)
    end
  end
end
