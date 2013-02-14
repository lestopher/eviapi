require 'faraday_middleware'

module Eviapi
  # @private
  module Connection
    private

    def connection(raw=false)
      options = {
        :headers => { 'Accept' => "application/#{format}; charset=utf-8", 'User-Agent' => user_agent },
        :proxy   => nil,
        :port    => port,
        :ssl     => { :verify => false },
        :url     => endpoint
      }

      Faraday::Connection.new(options) do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use FaradayMiddleware::Mashify unless raw

        unless raw
          case format.to_s.downcase
          when 'json' then connection.use Faraday::Response::ParseJson
          end
        end

        # Uncomment the following line to see http logs
        connection.response :logger
        connection.adapter(adapter)
      end
    end
  end
end