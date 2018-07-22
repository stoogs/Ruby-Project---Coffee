require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/recipe')
also_reload('../models/*')
#home

get '/recipes' do
  @recipes = Recipe.show_all
  erb( :"/recipes/index")
end

# show
# get '/recipes' do
#   "Hello World"
# end
# new

# create

# edit

# update

# destroy