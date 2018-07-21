require_relative("coffee")
require_relative('patron')



# patron1 = Patron.new({"username" => "Mr Delete Me", "bio" => "Nescafe drinker"})
# patron1.save

patron1 = Patron.new({"username" => "Mr Delete Me", "bio" => "Nescafe drinker"})
patron1.save



# v60 = Coffee.new({"name" => "Vvvv", "brew_method" => "V60", "grams" => 16, "water_temp" => 94, "water_weight" => 250, "grind" => "salt", "info" => "add more info"})
# v60.save

# patron1 = Patron.new({"username" => "Mr Delete Me", "bio" => "Nescafe drinker"})
# patron1.save
# p patron1
# Patron.find_by_id(22) --- TESTED OK
# Patron.show_all       --- TESTED OK
# patron1.delete_by_id  --- TESTED OK
# Patron.delete_all     --- TESTED OK
# Coffee.show_all       --- TESTED OK
# v60.delete_by_id      --- TESTED OK
# Coffee.delete_all     --- TESTED OK