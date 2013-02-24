module Eviapi
  module Request
    # Perform an HTTP GET request
    def get(path, options={}, raw=false, unformatted=false, header_options=nil)
      request(:get, path, options, raw, unformatted, header_options)
    end

    # Perform an HTTP POST request
    def post(path, options={}, raw=false, unformatted=false, header_options=nil)
      request(:post, path, options, raw, unformatted, header_options)
    end

    # Perform an HTTP PUT request
    def put(path, options={}, raw=false, unformatted=false, header_options=nil)
      request(:put, path, options, raw, unformatted, header_options)
    end

    # Perform an HTTP DELETE request
    def delete(path, options={}, raw=false, unformatted=false, header_options=nil)
      request(:delete, path, options, raw, unformatted, header_options)
    end

    private

    # Perform an HTTP request
    def request(method, path, options, raw=false, unformatted=false, header_options=nil)
      response = connection(raw).send(method) do |request|
        # path = formatted_path(path) unless unformatted
        request.headers.merge!({ :cookie => self.cookie }) unless self.cookie.nil?
        case method
        when :get, :delete
          request.url(path, options)
        when :post, :put
          request.path = path
          request.body = options unless options.empty?
        end
      end

      # Setup the cookie if it's returned in the header
      if response.env[:response_headers][:set_cookie] != nil
        self.cookie = response.env[:response_headers][:set_cookie]
      end

      raw ? response : response.body
    end

    def formatted_path(path)
      [path, format].compact.join('.')
    end    
  end
end