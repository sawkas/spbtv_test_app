require File.join(File.dirname(__FILE__), 'app')

use Rack::PostBodyContentTypeParser

run SpbtvTestApp
