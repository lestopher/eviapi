module Eviapi
  class Client
    module Mapsweb
      module Email
        # List the email servers.
        #
        # input.All           Boolean optional
        # input.Application   String
        def email_list(input={}, raw=false)
          response = get('mw/Email.List', input, raw)
        end

        # Send an email.
        #
        # input.Name          String
        # input.JSONData      String
        def email_send(input={}, raw=false)
          response = post('mw/Email.List', input, raw)
        end
      end
    end
  end
end