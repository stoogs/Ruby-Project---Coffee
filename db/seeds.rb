require_relative('../models/recipe')
require_relative('../models/patron')
require_relative('../models/review')
Review.delete_all
Recipe.delete_all
Patron.delete_all

v60 = Recipe.new({"name" => "Scott Rao spin, xtraordinary ", "brew_method" => "V60", "grams" => 16, "water_temp" => 94, "water_weight" => 250, "grind" => "salt", "info" => "add more info"})
fp = Recipe.new({"name" => "French press mucky mess", "brew_method" => "French Press", "grams" => 32, "water_temp" => 94, "water_weight" => 500, "grind" => "very coarse", "info" => "add more info"})
ch = Recipe.new({"name" => "Weak and watery Chemex", "brew_method" => "Chemex", "grams" => 37 , "water_temp" => 94, "water_weight" => 500, "grind" => "sand", "info" => "add more info"})
ka = Recipe.new({"name" => "Yoshimi's best Kalita Wave", "brew_method" => "Kalita", "grams" => 14, "water_temp" => 94, "water_weight" => 200, "grind" => "sea salt", "info" => "add more info"})
recipes = [v60.save(),fp.save(),ch.save(),ka.save()]

p1 = Patron.new({"username" => "Mr Latte", "bio" => "takes milk"})
p2 = Patron.new({"username" => "Sir Spresso", "bio" => "God shot"})
p3 = Patron.new({"username" => "Mr Americano", "bio" => "with water"})
patrons = [p1.save(),p2.save(),p3.save()]

r1 = Review.new({"review" => "V60 P1 Dear catastrophe waitress, I'm sorry that you seem to have the weight of the world over you", "bean_rating" => 4, "patron_id" => p1.id, "recipe_id" => v60.id})
r2 = Review.new({"review" => "V60 P2 So give me coffee and TV, Peacefully, I've seen so much, I'm going blind", "bean_rating" => 1, "patron_id" => p2.id, "recipe_id" => v60.id})
r3 = Review.new({"review" => "FP P3 I don't wanna work in a building downtown", "bean_rating" => 2, "patron_id" => p3.id, "recipe_id" => fp.id})
r4 = Review.new({"review" => "CH P2 Johnny's in the basement, Mixing up the medicine, I'm on the pavement, Thinking about the government", "bean_rating" => 5, "patron_id" => p2.id, "recipe_id" => ch.id})
reviews = [r1.save,r2.save, r3.save,r4.save]

p "Completed #{recipes.length} Recipe Seeds"
p "Completed #{patrons.length} Patron Seeds"
p "Completed #{reviews.length} Recipe Seeds"

p Review.show_all


 #p1.link_persona_id_to_recipe
 #v60.link_recipe_id_to_person