module Eviapi
  class Client
    module Argosweb
      module Expression
        # Evaluates an expression.
        #
        # input.Expression         String (required)
        # input.Embedded           none
        # input.Redirect           none
        # input.JSONData           String    
        def expression_evaluate(input,raw=false)
          response = get('mw/Argos/Expression.Evaluate', input, raw)
        end
      end
    end
  end
end
