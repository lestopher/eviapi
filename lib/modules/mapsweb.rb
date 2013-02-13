module Mapsweb
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
    @request = @connection.post '/mw/Session.Authenticate', { :username => @username, :password => @password, :application => 'ArgosWeb' }
    return JSON.parse @request.body
  end

  def session_destroy
    @request = @connection.get '/mw/Session.Destroy'
    return JSON.parse @request.body
  end

  def session_noop
    @request = @connection.get '/mw/Session.Noop'
    return JSON.parse @request.body
  end

  def session_security_token_create
    @request = @connection.get '/mw/Session.SecurityToken.Create'
    @security_token = JSON.parse(@request.body)['data']['Token']
    return JSON.parse @request.body
  end

  def session_setup
    setup_session_params = 
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
 
    # Make the call
    @request = @connection.post '/mw/Session.Setup', {:Version => @setup_session_params[:Version], :JSONData => JSON.generate(@setup_session_params[:JSONData])}

    # Setup variables based on response
    @sessionid = JSON.parse(@request.body)['data']['SessionId']
    @connection.params['SessionId'] = @sessionid

    if @connection.headers['Cookie'].nil?
      @connection.headers['Cookie']   = @request['set-cookie'].split[0].chop
    end

    return JSON.parse @request.body

  end

  def session_verify
    @request = @connection.get '/mw/Session.Verify'
    return JSON.parse @request.body
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