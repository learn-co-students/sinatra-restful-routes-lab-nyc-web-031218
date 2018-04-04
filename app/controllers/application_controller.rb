require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #get recipes index
  get '/recipes' do
    # binding.pry
    @recipes = Recipe.all
    erb :index
  end

  #get new recipe form
  get '/recipes/new' do

    erb :new
  end

  #post new recipe
  post '/recipes' do
    # binding.pry

    @recipe = Recipe.create(params[:recipe])

    redirect "/recipes/#{@recipe.id}"
  end

  #get a recipe
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :show
  end

  #get edit page
  get '/recipes/:id/edit' do
    # binding.pry
    @recipe = Recipe.find(params[:id])


    erb :edit
  end

  patch '/recipes/:id' do
    @recipe.update(params[recipe])

    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    # binding.pry
    Recipe.destroy(params[:id])

    redirect "/recipes"

  end


end
