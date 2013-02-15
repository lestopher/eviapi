module Eviapi
  class Client
    module Mapsweb
      module Server
        # Gets the values of server global properties.
        #
        # input.Properties  String    Comma serparted lsit
        def properties_get(input={}, raw=false)
          response = get('mw/Server.Properties.Get', input, raw)
        end

        # Retrieves the value of server-supported system variables
        def variable_get(input={}, raw=false)
          response = get('mw/Server.Variable.Get', input, raw)
        end

        alias_method :server_properties_get, :properties_get
        alias_method :server_variable_get, :variable_get

      end
    end
  end
end