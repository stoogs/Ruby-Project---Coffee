require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/recipe')
also_reload('../models/*')
#home

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
  p "------"
  p recipe.grams.to_i
  p recipe.water_weight.to_i
  recipe.ratio = recipe.water_weight.to_i / recipe.grams.to_i
  p "---ratio---"
  p recipe.ratio
  recipe.update
  redirect to "/recipes/#{(params['id'])}"
end

# destroy
post '/recipes/:id/delete' do
  recipe = Recipe.find_by_id(params['id'])
  recipe.delete_by_id
  redirect to '/recipes'
end