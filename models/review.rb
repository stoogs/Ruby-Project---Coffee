require_relative('../db/sql_runner.rb')

class Review

attr_reader :id, :review, :bean_rating, :patron_id, :recipe_id

def initialize(options)
    @id = options['id'].to_i if options['id']
    @review = options['review']
    @bean_rating = options['bean_rating']
    @patron_id = options['patron_id'].to_i
    @recipe_id = options['recipe_id'].to_i
end #intitialize


end # class end