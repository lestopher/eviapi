module Eviapi
  class Client
    module Mapsweb
      module Log
        # Any client can add information to the MAPS log.
        #
        # input.Status      String    Can be: Debug || Error || Information || Trace || Warning
        # input.Message     String
        def add(input={}, raw=false)
          response = post('mw/Log.Add', input, raw)
        end

        alias_method :log_add, :add
      end
    end
  end
end
