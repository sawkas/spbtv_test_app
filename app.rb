ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require_relative 'app/actions'
require_relative 'app/data_services/helpers'
require_relative 'app/data_services/base'
require_relative 'app/data_services/hash'

class SpbtvTestApp < Sinatra::Application
  before do
    content_type :json
  end

  configure do
    set :data_service, DataServices::Hash.new
  end
end
