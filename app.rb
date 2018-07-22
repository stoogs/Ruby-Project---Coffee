require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/patron_controller')
#require_relative('controllers/review_controller')
#require_relative('controllers/recipe_controller')

get '/' do
    erb( :index)
end
