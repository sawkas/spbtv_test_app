ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require 'dotenv/load'

require_relative 'app/actions'
require_relative 'app/data_services/helpers'
require_relative 'app/data_services/base'
require_relative 'app/data_services/hash'

class SpbtvTestApp < Sinatra::Application
  before do
    content_type :json
  end

  configure do
    data_service_string = ENV['DATA_SERVICE'] || :hash
    data_service = "DataServices::#{data_service_string.capitalize}".constantize
    set :data_service, data_service.new
  end
end
