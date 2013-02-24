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

        def session_authenticate(input={}, raw=false)
          options  = {
            :username => self.client_username,
            :password => self.client_password,
            :application => self.application
          }

          input = options if input.empty?

          response = post('mw/Session.Authenticate', input, raw, false)
        end

        # When a client wants to log out it will destroy its session.
        def session_destroy(input={}, raw=false)
          response = get('mw/Session.Destroy', input, raw)
        end

        # Used as a keep-alive technique.  The client sends this message to inform the
        # server that it still exists and to prevent the session from being destroyed.
        def session_noop(input={}, raw=false)
          response = get('mw/Session.Noop', input, raw)
        end

        # Create a single-use security token.
        #
        # input.SessionId   String
        def session_securitytoken_create(input={}, raw=false)
          response = get('mw/Session.SecurityToken.Create', input, raw)
        end

        # One of the first functions any client should call.  This function tells 
        # the server how the client expects to communicate.  In response, the
        # server tells the client how it expects to communicate which may alter some
        # of the client's values.
        #
        # input.Version   String
        # input.JSONData  String
        def session_setup(input={}, raw=false)
          options = Eviapi::Configuration::SETUP_SESSION_PARAMS.to_json

          # Override if nothing is passed to it
          input   = options if input.empty?

          response    = post("mw/Session.Setup", input, raw)
        end

        # This function allows a client to verify its authentication data.  It
        # returns the same values that "Session.Authenticate" does without
        # changing any authentication.
        #
        # input.Application   String optional
        def session_verify(input={}, raw=false)
          input = { :Application => 'ArgosWeb' } if input.empty?
          response = get('mw/Session.Verify', input, raw)
        end

        alias_method :auth, :session_authenticate
        alias_method :destroy, :session_destroy
        alias_method :noop, :session_noop
        alias_method :token, :session_securitytoken_create
        alias_method :setup, :session_setup
        alias_method :verify, :session_verify
      end
    end
  end
end