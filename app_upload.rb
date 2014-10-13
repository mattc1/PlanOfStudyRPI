require 'sinatra'
require 'rubygems'
require 'haml'
# require 'sinatra/base'
# require 'sinatra/assetpack'

set :port, 8080
# set :static, true
# set :public_folder, "static"
set :views, "views"

# class App < Sinatra::base
# 	register Sinatra::AssetPack
# 	assets do
# 		js :application, [
#     	'/js/colpick.js',
#     	# '/js/app.js'
#     # You can also do this: 'js/*.js'
#   		]

# 	  	css :application, [
# 	    # '/css/jqueryui.css',
# 	    # '/css/reset.css',
# 	    # '/css/foundation.sass',
# 	    '/css/colpick.css'
# 	   	]

# 	    js_compression :jsmin
# 	    css_compression :sass
# 	end

get '/' do
    return 'Hello world'
end

get '/hello/' do
    greeting = params[:greeting] || "Hi There"
    erb :index, :locals => {'greeting' => greeting}
end

# Handle GET-request (Show the upload form)
get '/upload' do
  haml :upload
end      
    
# Handle POST-request (Receive and save the uploaded file)
post '/upload' do 
  File.open('uploads/' + params['myfile'][:filename], "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  return "The file was successfully uploaded!"
end
