module Eviapi
  class Client
    module Mapsweb
      module Mapplet
        # Retrieve information about a Mapplet
        #
        # input.GUID        String
        def mapplet_information(input={}, raw=false)
          response = get('mw/Mapplet.Information', input, raw)
        end

        # Get properties of a Mapplet
        #
        # input.GUID        String
        # input.Properties  String optional
        def mapplet_properties_get(input={}, raw=false)
          response = get('mw/Mapplet.Properties.Get', input, raw)
        end

        alias_method :m_i, :mapplet_information
        alias_method :m_p_g, :mapplet_properties_get
      end
    end
  end
end