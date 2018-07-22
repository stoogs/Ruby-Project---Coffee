require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/review')
require_relative('../models/recipe')
require_relative('../models/patron')
also_reload('../models/*')
#home

get '/reviews' do
  @reviews = Review.show_all
  erb( :"/reviews/index")
end

# show
# get '/reviews' do
#   "Hello World"
# end
# new

# create

# edit

# update

# destroy