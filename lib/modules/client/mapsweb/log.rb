module Eviapi
  class Client
    module Mapsweb
      module Log
        # Any client can add information to the MAPS log.
        #
        # input.Status      String    Can be: Debug || Error || Information || Trace || Warning
        # input.Message     String
        def log_add(input={}, raw=false)
          response = post('mw/Log.Add', input, raw)
        end

        alias_method :l_a, :log_add
      end
    end
  end
end
