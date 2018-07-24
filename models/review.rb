require_relative('../db/sql_runner.rb')
# require('pry-byebug')
class Review

attr_reader :id, :review, :bean_rating, :patron_id, :recipe_id

def initialize(options)
    @id = options['id'].to_i if options['id']
    @review = options['review']
    @bean_rating = options['bean_rating']
    @patron_id = options['patron_id'].to_i
    @recipe_id = options['recipe_id'].to_i
end #intitialize

def save() #OK
    sql = "INSERT INTO reviews (review, bean_rating) VALUES ($1,$2) RETURNING id"
    values = [@review,@bean_rating]
    results = SqlRunner.run(sql,values)
    @id = results.first['id'].to_i
end #save

def recipe #OK
    sql = "SELECT * FROM recipes
    WHERE id = $1"
    values = [@recipe_id]
    results = SqlRunner.run(sql,values)
    return Recipe.new(results.first) #returns hash in 1 deep array
end #recipe

def patron #OK
    sql = "SELECT * FROM patrons 
    WHERE id = $1"
    values = [@patron_id]
    results = SqlRunner.run(sql,values)
    return Patron.new(results.first) #returns hash in 1 deep array
end #patron

def update() #TO TEST
    sql = "UPDATE reviews SET (review,bean_rating) = ($1,$2) WHERE id = $3"
    values = [@review,@bean_rating,@id]
    SqlRunner.run(sql, values)
end

#pass a recipe and calculate in SQL
def average_bean_rating
    sql = "SELECT AVG(bean_rating) FROM reviews
    WHERE recipe_id = $1"
    values = [@recipe_id]
    avg_br = SqlRunner.run(sql,values)
    return avg_br[0]['avg'].to_f
end #average_bean_rating

def self.show_all #OK
    sql = "SELECT * FROM reviews"
    results_array_of_hashes = SqlRunner.run(sql)
    return results_array_of_hashes.map {|hash| Review.new(hash)}
end #self.show_all

def self.find_by_id(id) #OK
    sql = "SELECT * FROM public.reviews WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql,values)
    return Review.new(result.first) #returns hash in 1 deep array
end #find

def delete_by_id #OK - MESSED WITH
    sql = "DELETE FROM public.reviews WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
    #will link or delete on cascade affect this?
end

def self.delete_all #OK
    sql = "DELETE FROM public.reviews"
    SqlRunner.run(sql)
    #is this a good idea?
end

#EXTENSION FUNCTIONS

#return true/false for duplicate recipes
#def is_recipe_duplicate?
#get all recipes - all = Recipe.show_all
#for each recipe , returned as a array of hashes
#if recipe = @recipe
#return true/false
#end #is_recipe_duplicate

end # class end