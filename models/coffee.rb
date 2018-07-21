require_relative('../db/sql_runner')

class Coffee
    
    attr_reader( :id, :name, :brew_method, :grams, :water_temp, :water_weight, :grind, :info)

def initialize( options )
    @id = options['id'].to_i if options['id']   # NO$ STRING / INT
    @name = options['name']                     # $1  STRING
    @brew_method = options['brew_method']       # $2  STRING
    @grams = options['grams']                   # $3  INT
    @water_temp = options['water_temp']         # $4  INT
    @water_weight = options['water_weight']     # $5  INT
    @grind = options['grind']                   # $6  STRING
    @brew_time = options['brew_time']           # NO$ INT
    @ratio = options['ratio']                   # $7  INT
    @info = options['info']                     # $8  STRING
end #initialize

c = Coffee.new({"name" => "hey", "brew_method" => "V60", "grams" => 20, "water_temp" => 94, "water_weight" => 250, "grind" => "coarse", "info" => "additional info"})

#TO DO

def link_recipe_id_to_person
    #search for recipes by person id
    end 

#DONE
def save() #OK
    @ratio = @water_weight / @grams
    sql = "INSERT INTO recipes (name,brew_method,grams,water_temp,water_weight,grind,ratio,info) VALUES ($1,$2,$3,$4,$5,$6,$7,$8) RETURNING id"
    values = [@name,@brew_method,@grams,@water_temp,@water_weight,@grind,@ratio,@info]
    results = SqlRunner.run(sql,values)
    @id = results.first()['id'].to_i
end #save

def find(id) #OK
    sql = "SELECT * FROM recipes WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql,values)
    p results
    return Coffee.new(results.first)
end #find

def self.show_all #OK
    sql = "SELECT * FROM recipes"
    results_array_of_hashes = SqlRunner.run(sql)
    return results_array_of_hashes.map {|hash| Coffee.new(hash)}
    #sends back new coffee objects, created from hash values, from table search 
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

end #class
