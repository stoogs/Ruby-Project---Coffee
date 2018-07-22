require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/patron')
also_reload('../models/*')
#home

get '/patrons' do
  @patrons = Patron.show_all
  erb( :"/patrons/index")
end

# index
# get '/patrons' do
#     @patrons = Patron.show_all
#     erb( :"index" )
# end

# show
get '/patrons/:id' do
  @patrons = Patron.find_by_id(params['id'])
  erb( :"patrons/show" )
end

# new

# create

# edit
get '/patrons/:id/edit' do
  @patrons = Patron.find_by_id(params['id'])
  erb( :"patrons/edit")
  end
# update

# destroy