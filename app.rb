require 'rack'
require 'rack-flash'
require 'sass'
require 'haml'
require 'sinatra/base'
require 'sinatra/reloader'

class ExampleApp < Sinatra::Base
  # this enables cookie to survive closing the browser
  use Rack::Session::Cookie, :key => 'rack.session', :path => '/', :expire_after => 2592000, :secret => 'trehjkhfdes'
  use Rack::Flash  
  set :dump_errors, false
  # very important, PUT doesn't work without this
  enable :method_override
  # play nice with angular, this works: %body(ng-app=true)
  set :haml, :format => :html4
  set :static,true
  configure :development do
    register Sinatra::Reloader
    also_reload "lib/*.rb"
    also_reload "lib/**/*.rb"
    require 'ruby-debug'
  end
  configure :production do
    # these two enable error handler to be called
    set :raise_errors, false
    set :show_exceptions, false
  end
  configure :test do
    # this enables errors to pop right up in specs
    set :raise_errors, true
    set :dump_errors, false
    set :show_exceptions, false    
  end
  get "/" do
    haml :index
  end
end
