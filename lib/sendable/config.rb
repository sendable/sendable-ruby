module Sendable
  class Config
    attr_accessor :api_key

    def initialize
      set_defaults
    end

    def set_defaults
      if ENV.has_key?("SENDABLE_API_KEY")
        @api_key = ENV["SENDABLE_API_KEY"]
      else
        @api_key = ""
      end
    end
  end
end
