class Eviapi
  require 'faraday'
  require 'json'
  attr_accessor :username, :password, :hash, :server_url, :port, :request, :api_base, :security_token
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
            :Guid => "B052A35E-DC3B-4283-B732-7BEE3B095C5E",
            :Version => "5.0"
          }
        ]
      }
    }
  end

  def audit_add
    @request = @connection.get '/mw/Audit.Add'
    return JSON.parse @request.body
  end

  def connection_close(connection)
    @request = @connection.post '/mw/Connection.Close', { :name => connection }
    return JSON.parse @request.body
  end

  def server_properties_get
    @request = @connection.get '/mw/Server.Properties.Get'
    return JSON.parse @request.body
  end

  def server_properties_set
    @request = @connection.get '/mw/Server.Properties.Set'
    return JSON.parse @request.body
  end

  def server_variable_get
    @request = @connection.get '/mw/Server.Variable.Get'
    return JSON.parse @request.body
  end
  
  def server_variable_list
    @request = @connection.get '/mw/Server.Variable.List'
    return JSON.parse @request.body
  end
  
  def session_authenticate
    @request = @connection.get '/mw/Session.Authenticate', { :username => @username, :password => @password }
    return JSON.parse @request.body

    raise "Could not authenticate session" unless results['valid'] == true
  end

  def session_destroy
    @request = @connection.get '/mw/Session.Destroy'
    return JSON.parse @request.body

    raise "Could not destroy session" unless results['valid'] == true
  end

  def session_noop
    @request = @connection.get '/mw/Session.Noop'
    return JSON.parse @request.body

    raise "Session Noop failed" unless results['valid'] == true
  end

  def session_security_token_create
    @request = @connection.get '/mw/Session.SecurityToken.Create'
    return JSON.parse @request.body

    @security_token = results['data']['Token']
  end

  def session_setup
    @connection = Faraday.new :url => @server_url, :ssl => { :verify => false }  do |f|
      f.request   :url_encoded
      f.response  :logger
      f.adapter   Faraday.default_adapter
    end
    @request = @connection.get '/mw/Session.Setup', @setup_session_params
    return JSON.parse @request.body

    raise "Could not setup session" unless results['valid'] == true
  end

  def session_verify
    @request = @connection.get '/mw/Session.Verify'
    return JSON.parse @request.body
  end
end