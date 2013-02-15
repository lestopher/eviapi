module Eviapi
  class Client
    module Mapsweb
      module Audit
        # Any client can add information to the system audit log
        #
        # input.Action  String
        # input.Level   String  Can be Error || Information || Warning
        # input.String  String
        def audit_add(input={}, raw=false)
          response = post('mw/Audit.Add', input, raw)
        end
      end
    end
  end
end