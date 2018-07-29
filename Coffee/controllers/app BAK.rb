require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/review')
require_relative('../models/recipe')
require_relative('../models/patron')
also_reload('../models/*')
#home

get '/equipment/V60' do
  @reviews = Review.show_all
  @recipes = Recipe.show_all
  @patrons = Patron.show_all
  erb( :"/")
end
