module Eviapi
  class Client
    module Mapsweb
      module Mapplet
        # Retrieve information about a Mapplet
        #
        # input.GUID        String
        def information(input={}, raw=false)
          response = get('mw/Mapplet.Information', input, raw)
        end

        # Get properties of a Mapplet
        #
        # input.GUID        String
        # input.Properties  String optional
        def properties_get(input={}, raw=false)
          response = get('mw/Mapplet.Properties.Get', input, raw)
        end

        alias_method :mapplet_information, :information
        alias_method :mapplet_properties_get, :properties_get
      end
    end
  end
end