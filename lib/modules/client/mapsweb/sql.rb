module Eviapi
  class Client
    module Mapsweb
      module Sql
        # This function returns the DML statement type and list of variables
        # in a specified SQL statement.
        #
        # input.SQL     String
        def examine(input={}, raw=false)
          response = get('mw/Sql.Examine', input, raw)
        end

        # Initializes and executes a query and returns the results to the client.
        #
        # input.Origin              String    optional
        # input.MaxRecords          Integer   optional
        # input.CommandTimeout      Integer   optional
        # input.Connection          String
        # input.UserName            String    optional
        # input.Password            String    optional
        # input.Product             String
        # input.UniqueId            String
        # input.JSONData            String
        def quickopen(input={}, raw=false)
          response = post('mw/Sql.QuickOpen', input, raw)
        end

        alias_method :sql_examine, :examine
        alias_method :sql_quickopen, :quickopen
      end
    end
  end
end