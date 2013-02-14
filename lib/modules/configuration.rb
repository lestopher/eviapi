require File.expand_path('../version', __FILE__)

module Eviapi
  module Configuration
    # Array of valid options
    VALID_OPTIONS_KEYS = 
    [
      :adapter,
      :client_username,
      :client_password,
      :session_id,
      :endpoint,
      :port,
      :format,
      :user_agent
    ].freeze

    VALID_FORMATS =
    [
      :json
    ].freeze

    SETUP_SESSION_PARAMS = 
    {
      :Version => "4.2", 
      :JSONData => 
      {
        :Mapplets => 
        [
          {
            :Guid => "B052A35E-DC3B-4283-B732-7BEE3B095C5E",
            :Version => "4.2"
          }
        ]
      }
    }.freeze

    # Adapter to be used if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER         = Faraday.default_adapter
    
    DEFAULT_CLIENT_USERNAME = nil
    DEFAULT_CLIENT_PASSWORD = nil
    
    DEFAULT_SESSION_ID      = nil
    
    DEFAULT_ENDPOINT        = 'https://evidevjs1.evisions.com/'
    DEFAULT_PORT            = 443
    
    # The response format appended to the path and sent in the 'Accept' header if none is set
    #
    # @note JSON is the only available format at this time
    DEFAULT_FORMAT          = :json
    
    DEFAULT_USER_AGENT      = "Evisions Eviapi Ruby Gem #{Eviapi::VERSION}"

    # private vars
    attr_accessor *VALID_OPTIONS_KEYS

     # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter         = DEFAULT_ADAPTER
      self.client_password = DEFAULT_CLIENT_PASSWORD
      self.client_username = DEFAULT_CLIENT_USERNAME
      self.session_id      = DEFAULT_SESSION_ID
      self.endpoint        = DEFAULT_ENDPOINT
      self.format          = DEFAULT_FORMAT
      self.user_agent      = DEFAULT_USER_AGENT
    end
  end
end