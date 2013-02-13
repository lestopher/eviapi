class Eviapi
  require 'faraday'
  require 'json'
  require 'modules/mapsweb.rb'
  require 'modules/argosweb.rb'
  include Mapsweb
  include Argosweb

  attr_accessor :username, :password, :hash, :server_url, :port, :request, :api_base, :security_token, :sessionid
  attr_reader :setup_session_params, :connection

  # Instance methods
  def initialize(username=nil, password=nil, hash=nil, server_url='http://localhost', port='8080')
    if username.nil? || password.nil?
      puts "something is nil"
      raise "Username and/or password needs to be provided"
    end

    @username   = username
    @password   = password
    @hash       = hash
    @server_url = server_url
    @port       = port
    @api_base   = "#{server_url}/mw"
    # "Version=4.0&JSONData={\"Mapplets\":[{\"Guid\":\"B052A35E-DC3B-4283-B732-7BEE3B095C5E\",\"Version\":\"5.0\"}]}"
    @setup_session_params = 
    {
      :Version => "4.2", 
      :JSONData => 
      {
        :Mapplets => 
        [
          {
            :Guid => "B052A35E-DC3B-4283-B732-7BEE3B095C5E",
            :Version => "4.2"
          }
        ]
      }
    }
    headers = {
     'Accept' => 'application/json, text/javascript, */*; q=0.01',
     'Accept-Charset' => 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
     'Accept-Encoding' => 'gzip,deflate,sdch',
     'Accept-Language' => 'en-US,en;q=0.8',
     'Connection' => 'close'
    }

    @connection = Faraday::Connection.new :url => @server_url, :ssl => { :verify => false }, :headers => headers do |f|
      f.request   :url_encoded
      f.response  :logger
      f.adapter   Faraday.default_adapter
    end

  end


end