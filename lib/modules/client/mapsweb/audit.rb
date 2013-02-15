module Eviapi
  class Client
    module Mapsweb
      module Audit
        # Any client can add information to the system audit log
        #
        # input.Action  String
        # input.Level   String  Can be Error || Information || Warning
        # input.String  String
        def add(input={}, raw=false)
          response = post('mw/Audit.Add', input, raw)
        end

        alias_method :audit_add, :add
      end
    end
  end
end