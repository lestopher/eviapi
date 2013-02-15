module Eviapi
  class Client
    module Mapsweb
      module Session
        # When the client is ready to create an authenticated connection to the
        # server it will need to authenticate.  This will validate a user's 
        # security permissions and open additional functions.
        #
        # input.UserName    String
        # input.Password    String
        # input.Token       String
        # input.Application String optional
        # input.Sessionid   String
        #
        # Note: Either password or token is used but not both

        def authenticate(input={}, raw=false)
          # Note that we're always going to override username, password and application
          # if you don't like it, feel free to change it
          options  = {
            :username => self.client_username,
            :password => self.client_password,
            :application => self.application
          }

          input.merge!(options)

          response = post('mw/Session.Authenticate', input, raw, false)
        end

        # When a client wants to log out it will destroy its session.
        def destroy(raw=false)
          response = get('mw/Session.Destroy')
        end

        # Used as a keep-alive technique.  The client sends this message to inform the
        # server that it still exists and to prevent the session from being destroyed.
        def noop(raw=false)
          response = get('mw/Session.Noop')
        end

        # Create a single-use security token.
        #
        # input.SessionId   String
        def security_token_create(input={}, raw=false)
          response = get('mw/Session.SecurityToken.Create', input)
        end

        # One of the first functions any client should call.  This function tells 
        # the server how the client expects to communicate.  In response, the
        # server tells the client how it expects to communicate which may alter some
        # of the client's values.
        #
        # input.Version   String
        # input.JSONData  String
        def setup(input={}, raw=true)
          options = Eviapi::Configuration::SETUP_SESSION_PARAMS.to_json

          # Override if nothing is passed to it
          input   = options if input.empty?

          response    = post("mw/Session.Setup", input, raw)
          self.cookie = response.env[:response_headers][:set_cookie].split[0].chop
          raw ? response : response.body
        end

        # This function allows a client to verify its authentication data.  It
        # returns the same values that "Session.Authenticate" does without
        # changing any authentication.
        #
        # input.Application   String optional
        def verify(input={}, raw=false)
          input = { :Application => 'ArgosWeb' } if input.empty?
          response = get('mw/Session.Verify', input)
        end
      end
    end
  end
end