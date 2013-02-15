module Eviapi
  class Client
    module Mapsweb
      module Connection
        # Closes the specified connection.
        #
        # input.Name  String
        def close(input={}, raw=false)
          response = post('mw/Connection.Close', input, raw)
        end

        # Returns a list of authorized conenctions and pools for the 
        # current application.
        def list(input={}, raw=false)
          response = get('mw/Connection.List', input, raw)
        end

        # Opens a connection to the specified database.
        #
        # input.Name        String
        # input.Username    String optional
        # input.Password    String optional
        def open(input={}, raw=false)
          response = post('/mw/Connection.Open', input, raw)
        end

        # alias the methods as they're generic and will most likely clash
        alias_method :conenction_close, :close
        alias_method :conenction_list, :list
        alias_method :conenction_open, :open
      end
    end
  end
end