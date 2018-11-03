ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require_relative 'app/routes'

class SpbtvTestApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
end
