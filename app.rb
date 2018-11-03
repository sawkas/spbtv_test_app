ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require_relative 'app/actions'

class SpbtvTestApp < Sinatra::Application
  before do
    content_type :json
  end
end
