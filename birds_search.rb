class BirdsSearchApp < Sinatra::Base

   configure :production, :development do
    enable :logging
  end

  set :static, true
  set :root, File.dirname(__FILE__)

  get "/" do
    redirect "index.html"
  end


  #Solar routeså
  solr = RSolr.connect :url => 'http://localhost:8983/solr'

  get "/search/:search" do |search|
   page=params["page"].to_s
   solr.get 'select', :params => {:q => "title_t:"+ search, :wt => :json, :start=> page }
  end
end