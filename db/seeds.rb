require_relative("../models/coffee")

v60 = Coffee.new({"name" => "Vvvv", "brew_method" => "V60", "grams" => 16, "water_temp" => 94, "water_weight" => 250, "grind" => "salt", "info" => "add more info"})
fp = Coffee.new({"name" => "Frenchie", "brew_method" => "FP", "grams" => 32, "water_temp" => 94, "water_weight" => 500, "grind" => "very coarse", "info" => "add more info"})
ch = Coffee.new({"name" => "Chemmie", "brew_method" => "Chemex", "grams" => 37 , "water_temp" => 94, "water_weight" => 500, "grind" => "sand", "info" => "add more info"})
ka = Coffee.new({"name" => "Kaliii", "brew_method" => "Kalita", "grams" => 14, "water_temp" => 94, "water_weight" => 200, "grind" => "sea salt", "info" => "add more info"})

generate = [v60.save(),fp.save(),ch.save(),ka.save(),v60.save(),fp.save(),ch.save(),ka.save()]

p "Completed #{generate.length} Coffee Seeds"