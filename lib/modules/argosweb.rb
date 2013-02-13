module Argosweb
  # opt.Element or opt.El - String
  # opt.RevisionId        - String
  # opt.Guid              - String
  # opt.Id                - Integer
  # opt.Path              - String
  def datablock_data_get(opt)
    @request = @connection.get '/mw/Argos/DataBlock.Data.Get', opt
    return JSON.parse @request.body
  end

  # opt.Guid              - String
  # opt.Id                - Integer
  # opt.Path              - String
  def datablock_details_get(opt)
    @request = @connection.get '/mw/Argos/DataBlock.Details.Get', opt
    return JSON.parse @request.body
  end

  def datablock_details_set(opt)
    # Not implemented
  end

  # opt.Guid              - String
  # opt.Id                - Integer
  # opt.Path              - String
  def datablock_listchildren(opt)
    @request = @connection.get '/mw/Argos/DataBlock.Data.Get', opt
    return JSON.parse @request.body
  end

  # opt.Guid              - String
  # opt.Id                - Integer
  # opt.Path              - String
  def datablock_security_list(opt)
    @request = @connection.get '/mw/Argos/DataBlock.Data.Get', opt
    return JSON.parse @request.body
  end

  # opt.Expression        - String (required)
  # opt.Embedded          - none
  # opt.Redirect          - none
  # opt.JSONData          - String    
  def expression_evaluate(opt)
    @request = @connection.get '/mw/Argos/Expression.Evaluate', opt
    return JSON.parse @request.body
  end

  # opt.Guid              - String
  # opt.Id                - Integer
  # opt.Path              - String
  def folder_details_get(opt)
    require 'debugger'; debugger
    @request = @connection.get '/mw/Argos/Folder.Details.Get', opt
    return JSON.parse @request.body
  end

  # opt.Guid              - String
  # opt.Id                - Integer
  # opt.Path              - String
  def folder_listchildren(opt)
    @request = @connection.get '/mw/Argos/Folder.ListChildren', opt
    return JSON.parse @request.body
  end

  # opt.Text              - String
  # opt.MaxRecords        - Integer
  def folder_search(opt)
    @request = @connection.get '/mw/Argos/Folder.Search', opt
    return JSON.parse @request.body
  end

  # opt.Guid              - String
  # opt.Id                - Integer
  # opt.Path              - String
  def folder_security_list(opt)
    @request = @connection.get '/mw/Argos/Folder.Security.List', opt
    return JSON.parse @request.body
  end

  # opt.Guid              - String
  # opt.Path              - String
  def loo_data_get(opt)
    @request = @connection.get '/mw/Argos/LOO.Data.Get', opt
    return JSON.parse @request.body
  end

  # opt.Guid              - String
  # opt.Path              - String
  def loo_list(opt)
    @request = @connection.get '/mw/Argos/LOO.List', opt
    return JSON.parse @request.body
  end


end