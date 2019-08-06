
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    art = Article.create(params)
    redirect "/articles/#{art.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  post '/articles/:id' do
    article = Article.find(params[:id])
    article.update(params)
    redirect "/articles/#{article.id}"
  end

  delete '/articles/:id/delete' do
    Article.delete(params[:id])
    redirect "/articles"
  end

end
