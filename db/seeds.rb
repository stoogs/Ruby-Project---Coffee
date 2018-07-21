require_relative('../models/recipe')
require_relative('../models/patron')
require_relative('../models/review')






v60 = Recipe.new({"name" => "Vvvv", "brew_method" => "V60", "grams" => 16, "water_temp" => 94, "water_weight" => 250, "grind" => "salt", "info" => "add more info"})
fp = Recipe.new({"name" => "Frenchie", "brew_method" => "FP", "grams" => 32, "water_temp" => 94, "water_weight" => 500, "grind" => "very coarse", "info" => "add more info"})
ch = Recipe.new({"name" => "Chemmie", "brew_method" => "Chemex", "grams" => 37 , "water_temp" => 94, "water_weight" => 500, "grind" => "sand", "info" => "add more info"})
ka = Recipe.new({"name" => "Kaliii", "brew_method" => "Kalita", "grams" => 14, "water_temp" => 94, "water_weight" => 200, "grind" => "sea salt", "info" => "add more info"})

p1 = Patron.new({"username" => "Mr Latte", "bio" => "takes milk"})
p2 = Patron.new({"username" => "Sir Spresso", "bio" => "God shot"})
p3 = Patron.new({"username" => "Mr Americano", "bio" => "with water"})

generate = [v60.save(),fp.save(),ch.save(),ka.save(),v60.save(),fp.save(),ch.save(),ka.save()]
generate2 = [p1.save(),p2.save(),p3.save()]

review1 = Review.new({"review" => "This coffeee was like soooooo gooooood....", "bean_rating" => "4", "patron_id" => p1.id, "recipe_id" => v60.id })
p review1
review1.save
p "Completed #{generate.length} Recipe Seeds"
p "Completed #{generate2.length} Patron Seeds"