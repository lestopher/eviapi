module Eviapi
  class Client < API
    Dir[File.expand_path('../client/**/*.rb', __FILE__)].each{ |f| require f }

    include Eviapi::Client::Mapsweb::Audit
    include Eviapi::Client::Mapsweb::Connection
    include Eviapi::Client::Mapsweb::Email
    include Eviapi::Client::Mapsweb::File
    include Eviapi::Client::Mapsweb::Log
    include Eviapi::Client::Mapsweb::Mapplet
    include Eviapi::Client::Mapsweb::Password
    include Eviapi::Client::Mapsweb::Portal
    include Eviapi::Client::Mapsweb::Server
    include Eviapi::Client::Mapsweb::Session
    include Eviapi::Client::Mapsweb::Sql
    include Eviapi::Client::Mapsweb::User
  end
end