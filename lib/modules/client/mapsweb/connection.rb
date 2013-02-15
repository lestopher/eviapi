module Eviapi
  class Client
    module Mapsweb
      module Connection
        # Closes the specified connection.
        #
        # input.Name  String
        def connection_close(input={}, raw=false)
          response = post('mw/Connection.Close', input, raw)
        end

        # Returns a list of authorized connections and pools for the 
        # current application.
        def connection_list(input={}, raw=false)
          response = get('mw/Connection.List', input, raw)
        end

        # Opens a connection to the specified database.
        #
        # input.Name        String
        # input.Username    String optional
        # input.Password    String optional
        def connection_open(input={}, raw=false)
          response = post('/mw/Connection.Open', input, raw)
        end
      end
    end
  end
end