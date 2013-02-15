Evisions API Gem
==============
The purpose of this gem is to bundle up the all of the Evisions API calls into an easy to call Ruby gem.

Documentation
===========
The documentation for the API calls can be found at on the Evisions Confluence site.

+ [MAPSWeb](https://confluence.evisions.com:6443/display/DEV/MAPSWeb+API)
+ [ArgosWeb](https://confluence.evisions.com:6443/display/DEV/Argos+Web+API+Functions)

Todo
====
+ Implement all functions available
+ Create unit tests for each method

Build and Install
===========
In main folder type  

    rake

How To Use
=========
In IRB:  

    require 'eviapi'

    Eviapi.configure do |e|
        e.client_username = 'administrator'
        e.client_password = 'password'
        e.endpoint        = 'https://evidevjs1.evisions.com/'
        e.port            = 443
    end

    user = Eviapi.client

    # If you'd rather set the above after it's been instantiated...
    # user.client_username = 'administrator'
    # user.client_password = 'password'

    # Equivalent of session.setup
    user.setup

    # Authenticate your username/pass
    user.authenticate

    # Call whatever you like here
    [...]
    user.destroy # destroy session, duh