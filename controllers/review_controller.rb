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

# new  - SHOW ALL ITEMS
get '/reviews/new' do
  @reviews = Review.show_all
  erb( :"reviews/new")
end

#create - NEW LISTING
post '/reviews' do
  new_review = Review.new(params)
  new_review.save
  redirect to ("/reviews")
end

# show - LISTING BY ID
get '/reviews/:id' do
  @reviews = Review.find_by_id(params['id'])
  erb( :"reviews/show" )
end

# edit - EDIT BY ID
get '/reviews/:id/edit' do
  @reviews = Review.find_by_id(params['id'])
  erb( :"reviews/edit")
  end

# update
post '/reviews/:id' do
  review = Review.new(params)
  review.update
  #redirect to "/reviews/#{review.id()}"
  redirect to "/reviews/#{(params['id'])}"
end

# destroy
post '/reviews/:id/delete' do
  review = Review.find_by_id(params['id'])
  review.delete_by_id
  redirect to '/reviews'
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