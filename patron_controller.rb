require('sinatra')
require('sinatra/contrib/all')
require_relative('models/patron')
require_relative('models/recipe')
require_relative('models/review')
also_reload('./models/*')
#home
get '/' do
    @patrons = Patron.show_all
    @recipes = Recipe.show_all
     pp @recipes
    erb( :welcome )
  end

# index

# show

# new

# create

# edit

# update

# destroy