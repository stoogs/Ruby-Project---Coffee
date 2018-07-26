require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/patron_controller')
require_relative('controllers/review_controller')
require_relative('controllers/recipe_controller')


get '/' do
<<<<<<< HEAD
    @@patron_length = Patron.show_all
    @@review_length = Review.show_all
    @@recipe_length = Recipe.show_all
=======
    @reviews = Review.show_all
    @recipes = Recipe.show_all
    @patrons = Patron.show_all
>>>>>>> 4b81ea109daf96c5efb496553b8cd8c541471e1f
    erb( :index)
end
