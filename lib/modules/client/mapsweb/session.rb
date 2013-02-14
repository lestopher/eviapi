module Eviapi
  class Client
    module Mapsweb
      module Session
        def setup
          response = post("mw/Session.Setup", Eviapi::Configuration::SETUP_SESSION_PARAMS.to_json)
        end
      end
    end
  end
end