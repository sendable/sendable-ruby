require "sendable/version"
require "sendable/config"
require "sendable/client"

module Sendable
  class << self
    attr_accessor :config
  end

  def self.config
    @config ||= Config.new

    if block_given?
      yield @config
    else
      @config
    end
  end

  def self.client
    @client ||= Client.new(config.project_id, config.api_key)
  end
end
