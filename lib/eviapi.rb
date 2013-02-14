require 'faraday'
require 'json'
# require File.expand_path('../modules/mapsweb.rb', __FILE__)
# require File.expand_path('../modules/argosweb.rb', __FILE__)
require File.expand_path('../modules/configuration.rb', __FILE__)
require File.expand_path('../modules/api.rb', __FILE__)
require File.expand_path('../modules/client.rb', __FILE__)

module Eviapi
  extend Configuration

  def self.client(options={})
    Eviapi::Client.new(options)
  end

  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  def self.resond_to?(method)
    return client.respond_to?(method) || super
  end
end