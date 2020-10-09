
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # set :method_override, true
  end

  get '/' do
  end
  #read
  get '/articles' do
    @articles = Article.all
    erb :index
    # binding.pry
  end
  
  get '/articles/new' do

    erb :new
  end

  
  post '/articles' do
    author = Article.create(params)
    
    # binding.pry
    redirect "/articles/#{author.id}"
  end
  
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    
    erb :edit
  end
  
  patch '/articles/:id' do
    # binding.pry
    article = Article.find(params[:id])
    params.delete("_method")
    article.update(params)
    
    redirect "/articles/#{article.id}"
    # binding.pry
  end

  get '/articles/:id' do 
    @article=Article.find(params[:id])
    erb :show
  end

  delete "/articles/:id" do |id|
    Article.find(id).delete
   
   redirect "articles"
  end

end
