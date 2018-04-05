class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :recipes

  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    if params[:recipe]
      @recipe = Recipe.create(params[:recipe])
    else
      @recipe = Recipe.create(name: params[:name],ingredients: params[:ingredients],cook_time: params[:cook_time])
    end
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :update
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show_recipe
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect "/recipes/#{params[:id]}"
   end



  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect "/recipes"
  end






end
