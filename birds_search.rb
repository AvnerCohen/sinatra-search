class BirdsSearchApp < Sinatra::Base

 configure :production, :development do
  enable :logging
 end

 set :static, true
 set :root, File.dirname(__FILE__)

 get "/" do
  redirect "index.html"
 end


 #Solar client
 solr = RSolr.connect :url => 'http://localhost:8983/solr'
 #redis client
 redis = Redis.new

 get "/search/:search" do |search|
  page=params["page"].to_s

  redis_response  = redis.get("#{page}:#{search}")

  if redis_response.nil?
   response=solr.get 'select', :params => {:q => "title_t:"+ search, :wt => :json, :start=> page }
   redis.set("#{page}:#{search}", response)
   logger.error "SolrHit"
   return response
  else
   logger.error "CacheHit"
   return redis_response
  end
 end
end