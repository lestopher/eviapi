class Eviapi
  require 'faraday'
  require 'json'
  attr_accessor :username, :password, :hash, :server_url, :port, :request, :api_base, :security_token, :sessionid
  attr_reader :setup_session_params, :connection

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
    # "Version=4.0&JSONData={\"Mapplets\":[{\"Guid\":\"B052A35E-DC3B-4283-B732-7BEE3B095C5E\",\"Version\":\"5.0\"}]}"
    @setup_session_params = 
    {
      :Version => "4.0", 
      :JSONData => 
      {
        :Mapplets => 
        [
          {
            :Guid => "B052A35E-DC3B-4283-B732-7BEE3B095C5E",
            :Version => "4.0"
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

  def connection_list
    @request = @connection.get '/mw/Connection.List'
    return JSON.parse @request.body
  end

  def connection_open(name, username, password)
    @request = @connection.post '/mw/Connection.Open', { :name => name, :username => username, :password => password }
    return JSON.parse @request.body
  end

  # all is a boolean flag; must be ADMIN role to get all servers back
  def email_list(all, application)
    @request = @connection.post '/mw/Email.List', { :all => all, :application => application }
    return JSON.parse @request.body
  end

  def email_send(json_data)
    @request = @connection.post '/mw/Email.Send', { :JSONData => json_data }
    return JSON.parse @request.body
  end

  def log_add(status, message)
    @request = @connection.post '/mw/Log.Add', { :status => status, :message => message }
    return JSON.parse @request.body
  end

  def password_abilities_get
    @request = @connection.get '/mw/Password.Abilities.Get'
    return JSON.parse @request.body
  end

  def password_random
    @request = @connection.get '/mw/Password.Random'
    return JSON.parse @request.body
  end

  def password_rules
    @request = @connection.get '/mw/Password.Rules'
    return JSON.parse @request.body
  end

  def password_set(oldvalue, newvalue)
    @request = @connection.post '/mw/Password.Set', { :OldValue => oldvalue, :NewValue => newvalue }
    return JSON.parse @request.body
  end

  def password_test(password)
    @request = @connection.post '/mw/Password.Test', { :password => password }
    return JSON.parse @request.body
  end

  def portal_application_list
    @request = @connection.get '/mw/Portal.Application.List'
    return JSON.parse @request.body
  end

  def portal_widget_enabled
    @request = @connection.get '/mw/Portal.Widget.Enabled'
    return JSON.parse @request.body
  end
  
  def portal_widget_pinned
    @request = @connection.get '/mw/Portal.Widget.Enabled'
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
    @request = @connection.post '/mw/Session.Authenticate', { :username => @username, :password => @password }
    results  = JSON.parse @request.body

    if results['valid'] == true
      return JSON.parse @request.body
    else
      raise "Could not authenticate session"
    end
  end

  def session_destroy
    @request = @connection.get '/mw/Session.Destroy'
    results = JSON.parse @request.body

    if results['valid'] == true
      return JSON.parse @request.body
    else
      raise "Could not destroy session"
    end
  end

  def session_noop
    @request = @connection.get '/mw/Session.Noop'
    return JSON.parse @request.body

    raise "Session Noop failed" unless results['valid'] == true
  end

  def session_security_token_create
    @request = @connection.get '/mw/Session.SecurityToken.Create'
    @security_token = JSON.parse(@request.body)['data']['Token']
    return JSON.parse @request.body

  end

  def session_setup
    # headers = {
    #  'Accept' => 'application/json, text/javascript, */*; q=0.01',
    #  'Accept-Charset' => 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
    #  'Accept-Encoding' => 'gzip,deflate,sdch',
    #  'Accept-Language' => 'en-US,en;q=0.8',
    #  'Connection' => 'keep-alive'
    # }

    @connection = Faraday::Connection.new :url => @server_url, :ssl => { :verify => false } do |f|
      f.request   :url_encoded
      f.response  :logger
      f.adapter   Faraday.default_adapter
    end

    @request = @connection.post '/mw/Session.Setup', {:Version => @setup_session_params[:Version], :JSONData => JSON.generate(@setup_session_params[:JSONData])}
    @sessionid = JSON.parse(@request.body)['data']['SessionId']
    @connection.params['SessionId'] = @sessionid
    return JSON.parse @request.body

    raise "Could not setup session" unless results['valid'] == true
  end

  def session_verify
    @request = @connection.get '/mw/Session.Verify'
    results = JSON.parse @request.body

    if results['valid'] == true
      return JSON.parse @request.body
    else
      raise 'Could not verify session'
    end
  end

  def sql_examine(sql)
    @request = @connection.post '/mw/Sql.Examine', { :sql => sql }
    return JSON.parse @request.body
  end

  # Pass whatever you like into the options hash, but here's what's accepted
  # :text => "select 'blah' from dual"
  # :connection => "DEVL8"
  # :JSONData => "[{\"variables\":{}}]" 
  def sql_quick_open(options_hash)
    text       = options_hash[:text]
    connection = options_hash[:connection]
    json_data  = options_hash[:JSONData]

    # @request   = @connection.post '/mw/Sql.QuickOpen', { :text => text, :JSONData => json_data || '', :connection => connection }
    @request   = @connection.post '/mw/Sql.QuickOpen', { :text => text, :connection => connection }
    return JSON.parse @request.body
  end
end