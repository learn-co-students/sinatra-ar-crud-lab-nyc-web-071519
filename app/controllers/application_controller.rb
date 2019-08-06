
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/articles'
  end

  #get all articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #gets for create
  get '/articles/new' do
    @articles = Article.new
    erb :new
  end

  #create new article
  post '/articles' do
     @article = Article.create(params)
     article_id = @article.id
     url = "/articles/#{article_id}"
     redirect url
     erb :new
  end

  #get selected article
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #get update article
  # get '/articles/:id/edit' do
  #   @article = Article.find(params[:id])
  #   erb :edit
  # end
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end


#update article
#  patch '/articles/:id/edit' do
#    @article = Article.find(params[:id])
#    @article.update(params[:article])
#      redirect '/articles/#{@article.id}'
#  end
patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  #delete article
  delete '/articles/:id' do
      Article.destroy(params[:id])
      redirect '/articles'
  end


end
