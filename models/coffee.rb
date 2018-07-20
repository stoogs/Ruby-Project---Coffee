require_relative('../db/sql_runner')

class Coffee
    
    attr_reader( :id, :name, :brew_method, :grams, :water_temp, :water_weight, :grind, :info)

def initialize( options )
    @id = options['id'].to_i if options['id']   #STRING / INT
    @name = options['name']                     #STRING
    @brew_method = options['brew_method']       #STRING
    @grams = options['grams']                   #INT
    @water_temp = options['water_temp']         #INT
    @water_weight = options['water_weight']     #INT
    @grind = options['grind']                   #STRING
    @brew_time = options['brew_time']
    @ratio = options['ratio']
    @info = options['info']                     #STRING
end #initialize

c = Coffee.new({"name" => "hey", "brew_method" => "V60", "grams" => 20, "water_temp" => 94, "water_weight" => 250, "grind" => "coarse", "info" => "additional info"})


def save()
    sql = "INSERT INTO recipes (name,brew_method,grams,water_temp,water_weight,grind,info) VALUES ($1,$2,$3,$4,$5,$6,$7) RETURNING id"
    values = [@name,@brew_method,@grams,@water_temp,@water_weight,@grind,@info]
    results = SqlRunner.run(sql,values)
    @id = results.first()['id'].to_i
end #save


end #class
