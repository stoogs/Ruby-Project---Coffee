require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/patron')
require_relative('../models/review')
require_relative('../models/recipe')
also_reload('../models/*')
#home

get '/patrons' do
  @patrons = Patron.show_all
  @reviews = Review.show_all
  @recipes = Recipe.show_all
  erb( :"/patrons/index")
end

# new
get '/patrons/new' do
  @patrons = Patron.show_all
  erb( :"patrons/new")
end
#create
post '/patrons' do
  new_patron = Patron.new(params)
  new_patron.save
  redirect to ("/patrons")
end
# show
get '/patrons/:id' do
  @patrons = Patron.find_by_id(params['id'])
  erb( :"patrons/show" )
end
# edit
get '/patrons/:id/edit' do
  @patrons = Patron.find_by_id(params['id'])
  erb( :"patrons/edit")
  end
# update
post '/patrons/:id' do
  patron = Patron.new(params)
  patron.update
  redirect to "/patrons/#{(params['id'])}"
end
# destroy

post '/patrons/:id/delete' do
  patron = Patron.find_by_id(params['id'])
  patron.delete_by_id
  redirect to '/patrons'
end