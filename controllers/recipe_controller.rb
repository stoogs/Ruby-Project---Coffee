require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/recipe')
also_reload('../models/*')
require('pry-byebug')
#home

get '/equipment/v60' do
  category = "V60"
  @recipes = Recipe.gear(category)
  erb( :"/recipes/equipment/v60")
end

get '/equipment/chemex' do
  category = "Chemex"
  @recipes = Recipe.gear(category)
  erb( :"/recipes/equipment/chemex")
end

get '/equipment/frenchpress' do
  category = "French Press"
  @recipes = Recipe.gear(category)
  erb( :"/recipes/equipment/frenchpress")
end

get '/equipment/aeropress' do
  category = "Aeropress"
  @recipes = Recipe.gear(category)
  erb( :"/recipes/equipment/aeropress")
end

get '/equipment/kalitawave' do
  category = "Kalita Wave"
  @recipes = Recipe.gear(category)
  erb( :"/recipes/equipment/kalitawave")
end

get '/equipment/coldbrew' do
  category = "Cold Brew"
  @recipes = Recipe.gear(category)
  erb( :"/recipes/equipment/coldbrew")
end


get '/recipes' do
  @reviews = Review.show_all
  @recipes = Recipe.show_all
  erb( :"recipes/index")
end

# new - GET - SHOW ALL ITEMS
get '/recipes/new' do
  @recipes = Recipe.show_all
  erb( :"recipes/new")
end

#create - POST - NEW LISTING
post '/recipes' do
  recipe = Recipe.new(params)
  recipe.save
  redirect to ("/recipes")
end

# show - LISTING BY ID                     
get '/recipes/:id' do
  @recipes = Recipe.find_by_id(params['id'])
  @id_pass = (params['id'])
  erb( :"recipes/show" )
end

# edit - EDIT
get '/recipes/:id/edit' do
  @recipes = Recipe.find_by_id(params['id'])
  erb( :"recipes/edit")
  end


# update
post '/recipes/:id' do
  recipe = Recipe.new(params)
  recipe.ratio = recipe.water_weight.to_i / recipe.grams.to_i
  recipe.update
  redirect to "/recipes/#{(params['id'])}"
end

# destroy
post '/recipes/:id/delete' do
  recipe = Recipe.find_by_id(params['id'])
  recipe.delete_by_id
  redirect to '/recipes'
end

get '/equipment/:model' do 
  model = params[:model]
  @recipes = Recipe.gear(model)
  erb_file = "/recipes/equipment" + model
 erb( :"erb_file".to_s)
end