module Eviapi
  class Client
    module Mapsweb
      module File
        # Used to retrieve files from the MAPS file system.  The file
        # operations created via the Configuration Tool are used to verify
        # only allowed files are retrieved with the call.  The call was
        # initially added to support retrieving images from the file system
        # on the MAPS machine.
        #
        # input.Path            String
        # input.ContentPath     String optional
        def get(input={}, raw=false)
          response = post('mw/File.Get', input, raw)
        end

        alias_method :file_get, :get
      end
    end
  end
end