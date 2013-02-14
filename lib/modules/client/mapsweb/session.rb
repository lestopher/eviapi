module Eviapi
  class Client
    module Mapsweb
      module Session
        def authenticate(raw=false)
          options  = {
            :username => self.client_username,
            :password => self.client_password,
            :application => self.application
          }
          response = post('mw/Session.Authenticate', options, raw, false)
        end

        def destroy(raw=false)
          response = get('mw/Session.Destroy')
        end

        def noop(raw=false)
          response = get('mw/Session.Noop')
        end

        def security_token_create(raw=false)
          response = get('mw/Session.SecurityToken.Create')
        end

        def setup(raw=true)
          response    = post("mw/Session.Setup", Eviapi::Configuration::SETUP_SESSION_PARAMS.to_json, raw)
          self.cookie = response.env[:response_headers][:set_cookie].split[0].chop
          raw ? response : response.body
        end

        def verify(raw=false)
          response = get('mw/Session.Verify')
        end
      end
    end
  end
end