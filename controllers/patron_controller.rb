require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/patron')
also_reload('../models/*')
#home

get '/patrons' do
  @patrons = Patron.show_all
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

# index
# get '/patrons' do
#     @patrons = Patron.show_all
#     erb( :"index" )
# end
#show2

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

# destroy