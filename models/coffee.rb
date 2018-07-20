require_relative('../db/sql_runner')

class Coffee
    
    attr_reader( :name, :brew_method)

def initialize( options )
    # @id = options['id'].to_i if options['id']
    @name = options['name']
    @brew_method = options['brew_method']
    # @grams = options['grams']
    # @water_temp = options['water_temp']
    # @water_weight = options['water_weight']
    # @grind = options['grind']
    # @pre_infuse = options['pre_infuse']
    # @brew_time = options['brew_time']
    # @ratio = options['ratio']
    # @special_directions = options['special_directions']
end

c = Coffee.new({"name" => "hey", "brew_method" => "V60"})
p c

end