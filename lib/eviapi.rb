class Eviapi
  require 'faraday'

  attr_accessor :username, :password, :hash, :server_url, :port, :session, :api_base
  attr_reader :setup_session_params

  # Class methods
  def self.hi
    puts "helloworld"
  end

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
    # "Version=4.0&JSONData={\"Mapplets\":[{\"Guid\":\"B052A35E-DC3B-4283-B732-7BEE3B095C5E\",\"Version\":\"4.0\"}]}"
    @setup_session_params = 
    {
      :Version => "4.0", 
      :JSONData => 
      {
        :Mapplets => 
        [
          {
            :Guid => "052A35E-DC3B-4283-B732-7BEE3B095C5E",
            :Version => "4.0"
          }
        ]
      }
    }
  end

  def session_authenticate

  end

  def session_destroy
  end

  def session_noop
  end

  def session_security_token_create
  end

  def session_setup
    connection = Faraday.new :url => @server_url, :ssl => { :verify => false } 
    @session = connection.post do |request|
      request.url '/mw/Session.Setup'
      request.headers['Content-Type'] = 'application/json'
      request.body = '{ "Version": "4.0", "JSONData": { "Mapplets": [{ "Guid": ""052A35E-DC3B-4283-B732-7BEE3B095C5E"", "Version": "4.0"}]}}'
    end

    puts @session
  end

  def session_verify
  end
end