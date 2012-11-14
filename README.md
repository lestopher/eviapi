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

How To Use
=========
In IRB:  

    require 'eviapi'
    # The empty string is for hash.  Will raise error if username/pass is missing
    session = Eviapi.new 'administrator', 'ev1si0ns', '', 'https://evidevjs1.evisions.com', '443'
    # Tell the MAP Server what you expect and it will respond
    session.session_setup 
    # Authenticate your username/pass
    session.session_authenticate
    # Call whatever you like here
    [...]
    session.session_destroy # destroy session, duh