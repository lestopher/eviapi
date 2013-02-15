module Eviapi
  class Client
    module Mapsweb
      module Portal
        # Returns a list of applications that the administrator allows their
        # users to see. This list is filtered based on two server properties:
        # "OnlyShowLicensedApps", which only returns applications the 
        # institution has a valid license for and 
        # "OnlyShowUserAccessibleApplications", which only returns
        # applications the user has access to.
        def application_list(input={}, raw=false)
          response = get('mw/Portal.Application.List', input, raw)
        end

        # Returns a list of widget classes (in alphabetical order) that are
        # set to enabled by the administrator in config tool.
        def widget_enabled(input={}, raw=false)
          response = get('mw/Portal.Widget.Enabled')
        end

        # Returns a list of 4 widget classes that are set to pinnned by the
        # administrator in config tool. The position of the widget class
        # name in the list determines the position of the pinned widget in
        # the config tool, starting from the left most class name as
        # position number 1.
        def widget_pinned(input={}, raw=false)
          response = get('mw/Portal.Widget.Pinned',input, raw)
        end

        alias_method :portal_application_list, :application_list
        alias_method :portal_widget_enabled, :widget_enabled
        alias_method :portal_widget_pinned, :widget_pinned
      end
    end
  end
end
