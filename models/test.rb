require_relative("../models/coffee")

v60 = Coffee.new({"name" => "Vvvv", "brew_method" => "V60", "grams" => 16, "water_temp" => 94, "water_weight" => 250, "grind" => "salt", "info" => "add more info"})

v60.save

p v60.find(90)