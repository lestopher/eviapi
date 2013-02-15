module Eviapi
  class Client
    module Argosweb
      module LibraryOfObjects 
        # Gets the data of an object in the Library of Objects.
        #
        # input.Guid               String
        # input.Path               String
        def loo_data_get(input={}, raw=false)
          response = get('mw/Argos/LOO.Data.Get', input, raw)
        end

        # Lists child objects in the Library of Objects.
        #
        # input.Guid               String
        # input.Path               String
        def loo_list(input={}, raw=false)
          response = get('mw/Argos/LOO.List', input, raw)
        end
      end
    end
  end
end
