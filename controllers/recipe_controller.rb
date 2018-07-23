require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/recipe')
also_reload('../models/*')
#home

get '/recipes' do
  @recipes = Recipe.show_all
  erb( :"recipes/index")
end

# new - SHOW ALL ITEMS
get '/recipes/new' do
  @recipes = Recipe.show_all
  erb( :"recipes/new")
end

#create - NEW LISTING
post '/recipes' do
  new_recipe = Recipe.new(params)
  new_recipe.save
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
  recipe.update
  redirect to "/recipes/#{(params['id'])}"
end

# destroy
post '/recipes/:id/delete' do
  recipe = Recipe.find_by_id(params['id'])
  recipe.delete_by_id
  redirect to '/recipes'
end