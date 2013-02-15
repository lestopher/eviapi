module Eviapi
  class Client
    module Argosweb
      module DataBlock
        # Gets the data of a defined DataBlock
        #
        # input.Element or input.El  String
        # input.RevisionId         String
        # input.Guid               String
        # input.Id                 Integer
        # input.Path               String
        def datablock_data_get(input={}, raw=false)
          response = get('mw/Argos/DataBlock.Data.Get', input, raw)
        end

        # Read the details of a DataBlock
        #
        # input.Guid               String
        # input.Id                 Integer
        # input.Path               String 
        def datablock_details_get(input={}, raw=false)
          response = get('mw/Argos/DataBlock.Details.Get', input, raw)
        end

        # Lists all children of a DataBlock
        #
        # input.Guid               String
        # input.Id                 Integer
        # input.Path               String
        def datablock_listchildren(input={}, raw=false)
          response = get('mw/Argos/DataBlock.ListChildren', input, raw)
        end

        # List security items of a DataBlock
        #
        # input.Guid               String
        # input.Id                 Integer
        # input.Path               String
        def datablock_security_list(input={}, raw=false)
          response = get('mw/Argos/DataBlock.Security.List', input, raw)
        end

        alias_method :db_data_get, :datablock_data_get
        alias_method :db_details_get, :datablock_details_get
        alias_method :db_children, :datablock_listchildren
        alias_method :db_security, :datablock_security_list
      end
    end
  end
end
