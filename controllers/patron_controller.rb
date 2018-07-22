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
# get '/patrons' do
#   "Hello World"
# end
# new

# create

# edit

# update

# destroy