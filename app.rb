require 'sinatra'

class MyTimehop < Sinatra::Application
end

require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'routes/init'
