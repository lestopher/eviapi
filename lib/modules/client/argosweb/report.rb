module Eviapi
  class Client
    module Argosweb
      module Report
        # Reads the details of a Report
        #
        # input.Guid               String
        # input.Id                 String
        # input.Path               String
        def report_details_get(input,raw=false)
          response = get('mw/Argos/Report.Details.Get', input, raw)
        end

        # Runs a Report on the server using the Argos Report Runner.
        #
        # input.Guid               String
        # input.Id                 String
        # input.Path               String
        def report_run(input,raw=false)
          response = post('mw/Argos/Report.Run', input, raw)
        end

        # Return data of a specified saved state.
        #
        # input.Guid               String
        # input.Id                 String
        # input.Path               String
        # input.SSID               String
        def report_savedstate_get(input,raw=false)
          response = get('mw/Argos/Report.SavedState.Get', input, raw)
        end

        # Returns list of saved states of a report.
        #
        # input.Guid               String
        # input.Id                 String
        # input.Path               String
        def report_savedstate_list(input,raw=false)
          response = get('mw/Argos/Report.SavedState.List', input, raw)
        end

        # List security items of a Report
        #
        # input.Guid               String
        # input.Id                 String
        # input.Path               String
        def report_security_list(input,raw=false)
          response = get('mw/Argos/Report.Security.List', input, raw)
        end

        # List the variables that a report is dependent on in order to run.
        #
        # input.Guid               String
        # input.Id                 String
        # input.Path               String
        def report_variable_list(input,raw=false)
          response = get('mw/Argos/Report.Variable.List', input, raw)
        end
      end
    end
  end
end
