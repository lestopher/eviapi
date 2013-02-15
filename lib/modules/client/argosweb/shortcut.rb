module Eviapi
  class Client
    module Argosweb
      module Shortcut
        # Add a shortcut
        #
        # input.Path               Path_String
        # input.Name               String
        # input.BarName            String
        # input.NodeType           String
        # input.OpenMode           String
        # input.Public             Boolean
        def shortcut_add(input,raw=false)
          response = post('mw/Argos/Shortcut.Add', input, raw)
        end

        # Runs a Report on the server using the Argos Report Runner.
        #
        # input.Name               String
        # input.BarName            String
        # input.Public             Boolean
        def shortcut_delete(input,raw=false)
          response = post('mw/Argos/Shortcut.Delete', input, raw)
        end

        # Lists all the public and private shortcuts and folders.
        #
        # input.BarName            String
        # input.Public             Boolean
        def shortcut_list(input,raw=false)
          response = get('mw/Argos/Shortcut.List', input, raw)
        end

        # Modify a shortcut's name or barname properties.
        #
        # input.OldBarName            String
        # input.OldBarName            String
        # input.NewName               String
        # input.NewBarName            String
        # input.Public                Boolean
        def shortcut_modify(input,raw=false)
          response = post('mw/Argos/Shortcut.Modify', input, raw)
        end
      end
    end
  end
end
