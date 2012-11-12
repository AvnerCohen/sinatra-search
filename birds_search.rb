class BirdsSearchApp < Sinatra::Base
  set :static, true
  set :root, File.dirname(__FILE__)

  get "/" do
    redirect "index.html"
  end
end