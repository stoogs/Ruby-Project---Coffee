require_relative("recipe")
require_relative('patron')
require_relative('review')




patron1 = Patron.new({"username" => "Mr Delete Me", "bio" => "Nescafe drinker"})
patron1.save
v60 = Recipe.new({"name" => "Vvvv", "brew_method" => "V60", "grams" => 16, "water_temp" => 94, "water_weight" => 250, "grind" => "salt", "info" => "add more info"})
v60.save
review1 = Review.new({"review" => "This coffeee was like soooooo gooooood....", "bean_rating" => "4" })
p review1
review1.save


# patron1 = Patron.new({"username" => "Mr Delete Me", "bio" => "Nescafe drinker"})
# patron1.save
# p patron1
# Patron.find_by_id(22) --- TESTED OK
# Patron.show_all       --- TESTED OK
# patron1.delete_by_id  --- TESTED OK
# Patron.delete_all     --- TESTED OK
# Recipe.show_all       --- TESTED OK
# v60.delete_by_id      --- TESTED OK
# Recipe.delete_all     --- TESTED OK