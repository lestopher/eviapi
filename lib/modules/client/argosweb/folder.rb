module Eviapi
  class Client
    module Argosweb
      module Folder
        # Reads the details of a folder
        #
        # input.Expression        String (required)
        # input.Embedded          none
        # input.Redirect          none
        # input.JSONData          String    
        def folder_details_get(input={},raw=false)
          response = get('mw/Argos/Folder.Details.Get', input, raw)
        end

        # Lists all children of a folder
        # input.Guid               String
        # input.Id                 Integer
        # input.Path               String
        def folder_listchildren(input={}, raw = false)
          response = get('mw/Argos/Folder.ListChildren', input, raw)
        end

        # Returns a list of folder, datablock, or report names that match a
        # specified text.
        #
        # input.Text               String
        # input.MaxRecords         Integer
        def folder_search(input={}, raw=false)
          response = get('mw/Argos/Folder.Search', input, raw)
        end

        # List security items of a Folder
        #
        # input.Guid              - String
        # input.Id                - Integer
        # input.Path              - String
        def folder_security_list(input={}, raw=false)
          response = get('mw/Argos/Folder.Security.List', input, raw)
        end        
      end
    end
  end
end
