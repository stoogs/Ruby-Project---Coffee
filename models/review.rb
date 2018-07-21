require_relative('../db/sql_runner.rb')
require('pry-byebug')
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
    sql = "INSERT INTO reviews (review, bean_rating, patron_id, recipe_id) VALUES ($1,$2,$3,$4) RETURNING id"
    values = [@review,@bean_rating,@patron_id, @recipe_id]
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

def average_bean_rating
    sql = "SELECT AVG(bean_rating) FROM reviews
    WHERE recipe_id = $1"
    values = [@recipe_id]
    avg_br = SqlRunner.run(sql,values)
    return avg_br[0]['avg'].to_f
end #average_bean_rating

end # class end