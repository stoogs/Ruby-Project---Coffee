require_relative('../models/recipe')
require_relative('../models/patron')
require_relative('../models/review')
Review.delete_all
Recipe.delete_all
Patron.delete_all

v60 = Recipe.new({"name" => "Scott Rao spin, xtraordinary", "brew_method" => "V60", "grams" => 16, "water_temp" => 94, "water_weight" => 250, "grind" => "salt", "info" => "This recipe is for the 4-cup French Press coffee maker, which makes 2 small mugs of coffee. Double everything and follow the same process for the 8-cup (34-oz) version."})
fp = Recipe.new({"name" => "French press mucky mess", "brew_method" => "French Press", "grams" => 32, "water_temp" => 94, "water_weight" => 500, "grind" => "very coarse", "info" => "This recipe is for the 4-cup French Press coffee maker, which makes 2 small mugs of coffee. Double everything and follow the same process for the 8-cup (34-oz) version."})
ch = Recipe.new({"name" => "Weak and watery Chemex", "brew_method" => "Chemex", "grams" => 37 , "water_temp" => 94, "water_weight" => 500, "grind" => "sand", "info" => "This recipe is for the 4-cup French Press coffee maker, which makes 2 small mugs of coffee. Double everything and follow the same process for the 8-cup (34-oz) version."})
ka = Recipe.new({"name" => "Yoshimi's best Kalita Wave", "brew_method" => "Kalita Wave", "grams" => 14, "water_temp" => 94, "water_weight" => 200, "grind" => "sea salt", "info" => "aThis recipe is for the 4-cup French Press coffee maker, which makes 2 small mugs of coffee. Double everything and follow the same process for the 8-cup (34-oz) version."})
cb = Recipe.new({"name" => "Cold-Bru", "brew_method" => "Cold Brew", "grams" => 150, "water_temp" => 21, "water_weight" => 1000, "grind" => "Broken Glass", "info" => "This recipe is for the 4-cup French Press coffee maker, which makes 2 small mugs of coffee. Double everything and follow the same process for the 8-cup (34-oz) version."})
ae = Recipe.new({"name" => "Im-Press-ive", "brew_method" => "Aeropress", "grams" => 17, "water_temp" => 88, "water_weight" => 200, "grind" => "sea salt", "info" => "This recipe is for the 4-cup French Press coffee maker, which makes 2 small mugs of coffee. Double everything and follow the same process for the 8-cup (34-oz) version."})

recipes = [v60.save(),fp.save(),ch.save(),ka.save(),cb.save(), ae.save()]

p1 = Patron.new({"username" => "Mr Latte", "bio" => "takes milk, a lotta milk."})
p2 = Patron.new({"username" => "Ser Spresso", "bio" => "slightly Italian fellow after a God shot"})
p3 = Patron.new({"username" => "Mr Americano", "bio" => "water, with water and a bit of coffee"})
patrons = [p1.save(),p2.save(),p3.save()]

r1 = Review.new({"review" => "ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat", "bean_rating" => 4, "patron_id" => p1.id, "recipe_id" => v60.id})
r2 = Review.new({"review" => "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates", "bean_rating" => 1, "patron_id" => p2.id, "recipe_id" => v60.id})
r3 = Review.new({"review" => "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.", "bean_rating" => 2, "patron_id" => p3.id, "recipe_id" => fp.id})
r4 = Review.new({"review" => "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "bean_rating" => 1, "patron_id" => p2.id, "recipe_id" => ch.id})
r5 = Review.new({"review" => "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", "bean_rating" => 3, "patron_id" => p3.id, "recipe_id" => ae.id})
r6 = Review.new({"review" => "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "bean_rating" => 2, "patron_id" => p1.id, "recipe_id" => cb.id})
r7 = Review.new({"review" => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "bean_rating" => 5, "patron_id" => p3.id, "recipe_id" => ka.id})
reviews = [r1.save,r2.save, r3.save,r4.save,r5.save,r6.save,r7.save]

p "Completed #{recipes.length} Recipe Seeds"
p "Completed #{patrons.length} Patron Seeds"
p "Completed #{reviews.length} Recipe Seeds"

p Review.show_all


 #p1.link_persona_id_to_recipe
 #v60.link_recipe_id_to_person