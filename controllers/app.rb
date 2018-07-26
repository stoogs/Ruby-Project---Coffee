require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/review')
require_relative('../models/recipe')
require_relative('../models/patron')
also_reload('../models/*')
require('pry-byebug')
#home

<<<<<<< HEAD
get '/equipment/V60' do
=======
get '/equipment/v60' do
>>>>>>> 4b81ea109daf96c5efb496553b8cd8c541471e1f
  @reviews = Review.show_all
  @recipes = Recipe.show_all
  @patrons = Patron.show_all
  erb( :"/")
end
