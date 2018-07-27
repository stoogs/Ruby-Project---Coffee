require_relative('../db/sql_runner')

class Recipe
    
attr_reader( :id, :name, :brew_method, :grams, :water_temp, :water_weight, :grind, :info, :ratio, :brew_time )
attr_accessor( :ratio)

def initialize( options )
    @id = options['id'].to_i if options['id']   # NO$ STRING / INT
    @name = options['name']                     # $1  STRING
    @brew_method = options['brew_method']       # $2  STRING
    @grams = options['grams'].to_i                   # $3  INT
    @water_temp = options['water_temp']         # $4  INT
    @water_weight = options['water_weight'].to_i     # $5  INT
    @grind = options['grind']                   # $6  STRING
    @brew_time = options['brew_time']           # NO$ INT
    @ratio = options['ratio']                   # $7  INT
    @info = options['info']                     # $8  STRING
end #initialize

#c = Recipe.new({"name" => "hey", "brew_method" => "V60", "grams" => 20, "water_temp" => 94, "water_weight" => 250, "grind" => "coarse", "info" => "additional info"})

#DONE
def save() #OK
    @ratio =  @water_weight / @grams
    sql = "INSERT INTO recipes (name,brew_method,grams,water_temp,water_weight,grind,ratio,info) VALUES ($1,$2,$3,$4,$5,$6,$7,$8) RETURNING id"
    values = [@name,@brew_method,@grams,@water_temp,@water_weight,@grind,@ratio,@info]
    results = SqlRunner.run(sql,values)
    @id = results.first()['id'].to_i
end #save

def update()
    sql = "UPDATE recipes SET (name,brew_method,grams,water_temp,water_weight,grind,ratio,info) = ($1,$2,$3,$4,$5,$6,$7,$8) WHERE id = $9"
    values = [@name, @brew_method,@grams,@water_temp,@water_weight,@grind,@ratio,@info,@id]
    SqlRunner.run(sql, values)
  end

def self.find_by_id(id) #OK
    sql = "SELECT * FROM recipes WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql,values)
    return Recipe.new(result.first) #returns hash in 1 deep array
end #find

def self.show_all #OK
    sql = "SELECT * FROM recipes"
    results_array_of_hashes = SqlRunner.run(sql)
    p results_array_of_hashes
    return results_array_of_hashes.map {|hash| Recipe.new(hash)}
    #sends back new Recipe objects, created from hash values, from table search 
end #self show all

def self.gear(category) #OK
    sql = "SELECT * FROM recipes WHERE brew_method = $1"
    values = [category]
    results_array_of_hashes = SqlRunner.run(sql,values)
    return results_array_of_hashes.map {|hash| Recipe.new(hash)}
    #sends back new Recipe objects, created from hash values, from table search 
end #self show all

def delete_by_id #OK
    sql = "DELETE FROM recipes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
end #delete_by_id

def self.delete_all #OK
    sql = "DELETE FROM recipes"
    SqlRunner.run(sql)
end #self delete all

#pass a recipe and calculate in SQL
def average_bean_rating
    sql = "SELECT AVG(bean_rating) FROM reviews
    WHERE recipe_id = $1"
    values = [@id]
    avg_br = SqlRunner.run(sql,values)
    return avg_br[0]['avg'].to_f
end #average_bean_rating

# def link_recipe_id_to_person  #search for recipes by person id
#     sql = "SELECT recipes.* FROM recipes
#     INNER JOIN reviews
#     ON reviews.id = recipes.id
#     WHERE recipes.id = $1"  
#     values = [@id]
#     result = SqlRunner.run(sql,values)
#     p result.first
#     #search for recipe reviews by recipe id.
#     #search for recipes by person id  
# end #link

end #class
