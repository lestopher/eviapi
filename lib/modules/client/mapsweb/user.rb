module Eviapi
  class Client
    module Mapsweb
      module User
        # This function returns the value of one or more user settings.
        #
        # input.Properties        String      Comma delimited list
        def user_settings_get(input={}, raw=false)
          response = get('mw/User.Settings.Get', input, raw)
        end

        # This function sets the value of one or more user settings.
        def user_settings_set(input={}, raw=false)
          response = post('mw/User.Settings.Set', input, raw)
        end

        alias_method :user_s_g, :user_settings_get
        alias_method :user_s_s, :user_settings_set
      end
    end
  end
end