require_relative("../models/coffee")

v60 = Coffee.new({"name" => "Vvvv", "brew_method" => "V60", "grams" => 20, "water_temp" => 94, "water_weight" => 250, "grind" => "coarse", "info" => "add more info"})
fp = Coffee.new({"name" => "Frenchie", "brew_method" => "FP", "grams" => 20, "water_temp" => 94, "water_weight" => 250, "grind" => "coarse", "info" => "add more info"})
ch = Coffee.new({"name" => "Chemmie", "brew_method" => "Chemex", "grams" => 20, "water_temp" => 94, "water_weight" => 250, "grind" => "coarse", "info" => "add more info"})
ka = Coffee.new({"name" => "Kaliii", "brew_method" => "Kalita", "grams" => 20, "water_temp" => 94, "water_weight" => 250, "grind" => "coarse", "info" => "add more info"})

v60.save()
# fp.save()
# ch.save()
# ka.save()


p v60 
p fp 
p ch
p ka