module Eviapi
  class Client
    module Argosweb
      module Olap
        # Close OLAP cube previously created by OLAP.Execute
        #
        # input.Handle             String
        def olap_close(input,raw=false)
          response = post('mw/Argos/OLAP.Close', input, raw)
        end

        # Get the list of values and settings for a dimension
        #
        # input.JSONData           String
        def olap_dimension_get(input,raw=false)
          response = get('mw/Argos/OLAP.Dimension.Get', input, raw)
        end

        # Creates or modifies an OLAP cube in the Argos mapplet and returns its data
        #
        # input.JSONData           String
        def olap_execute(input,raw=false)
          response = post('mw/Argos/OLAP.execute', input, raw)
        end

        # Get the list of values and settings for a measure
        #
        # input.JSONData           String
        def olap_measure_get(input,raw=false)
          response = get('mw/Argos/OLAP.Measure.Get', input, raw)
        end

        # Validates calculated measures' formulas. Only works for calculated measures.
        #
        # input.JSONData           String
        def olap_measure_validate(input,raw=false)
          response = get('mw/Argos/OLAP.Measure.Validate', input, raw)
        end
      end
    end
  end
end
