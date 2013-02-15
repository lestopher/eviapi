module Eviapi
  class Client
    module Mapsweb
      module Email
        # List the email servers.
        #
        # input.All           Boolean optional
        # input.Application   String
        def list(input={}, raw=false)
          response = get('mw/Email.List', input, raw)
        end

        # Send an email.
        #
        # input.Name          String
        # input.JSONData      String
        def send(input={}, raw=false)
          response = post('mw/Email.List', input, raw)
        end

        alias_method :email_list, :list
        alias_method :email_send, :send
      end
    end
  end
end