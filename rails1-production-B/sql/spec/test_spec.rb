require 'rspec'
require 'test'

describe "SQL" do

  describe "russian_blue" do 
    it "finds the toys and price for all the cats with the breed `British Shorthair`" do
      expect(russian_blue).to eq([["Accusamus", "67"], ["Ad", "55"], ["Ad", "39"], ["Agility", "97"], ["Aliquid", "39"], ["Amnesia", "37"], ["Aperiam", "11"], ["Architecto", "93"], ["Aut", "76"], ["Aut", "94"], ["Aut", "83"], ["Barbecue Ribs", "89"], ["Beatae", "33"], ["Bitcoin SV", "77"], ["Bone Club", "42"], ["Bonemerang", "44"], ["Caprese Salad", "25"], ["Caprese Salad", "18"], ["Cheeseburger", "95"], ["Chicken Milanese", "37"], ["Chicken Parm", "57"], ["Chilli con Carne", "36"], ["Comet Punch", "36"], ["Confuse Ray", "80"], ["Consequatur", "65"], ["Corrupti", "41"], ["Dolores", "44"], ["Dolorum", "81"], ["Double Slap", "49"], ["Ebiten maki", "64"], ["Ember", "76"], ["Eos", "44"], ["Eos", "95"], ["Esse", "86"], ["Est", "68"], ["Et", "29"], ["Et", "37"], ["Et", "60"], ["Et", "99"], ["Eum", "92"], ["Explosion", "72"], ["Fire Punch", "10"], ["Fire Spin", "38"], ["Fly", "14"], ["Fuga", "47"], ["Fugiat", "87"], ["Fugit", "26"], ["Fury Attack", "79"], ["Growl", "70"], ["Growth", "46"], ["Harden", "39"], ["Harum", "99"], ["Hic", "16"], ["High Jump Kick", "29"], ["High Jump Kick", "75"], ["Horn Drill", "39"], ["Hyper Fang", "47"], ["Id", "64"], ["Id", "87"], ["Incidunt", "72"], ["Inventore", "80"], ["Ipsam", "94"], ["Ipsam", "18"], ["Iste", "20"], ["Iusto", "69"], ["Jump Kick", "85"], ["Laboriosam", "31"], ["Lasagne", "44"], ["Light Screen", "24"], ["Litecoin", "42"], ["Massaman Curry", "83"], ["Maxime", "83"], ["Maxime", "22"], ["Meatballs with Sauce", "59"], ["Meatballs with Sauce", "44"], ["Metronome", "96"], ["Minima", "96"], ["Minus", "50"], ["Mist", "90"], ["Molestiae", "77"], ["Molestias", "75"], ["Mount Targon", "70"], ["Mushroom Risotto", "93"], ["Neque", "79"], ["Nihil", "60"], ["Nisi", "90"], ["Non", "14"], ["Officia", "81"], ["Omnis", "80"], ["Pappardelle alla Bolognese", "77"], ["Pappardelle alla Bolognese", "86"], ["Pasta Carbonara", "47"], ["Peking Duck", "97"], ["Peking Duck", "32"], ["Peking Duck", "52"], ["Petal Dance", "67"], ["Petal Dance", "57"], ["Pierogi", "10"], ["Pin Missile", "89"], ["Pizza", "31"], ["Placeat", "20"], ["Poison Sting", "42"], ["Poison Sting", "11"], ["Pork Sausage Roll", "11"], ["Poro Toss", "59"], ["Praesentium", "79"], ["Praesentium", "22"], ["Quam", "37"], ["Qui", "73"], ["Qui", "72"], ["Qui", "80"], ["Quia", "37"], ["Quia", "48"], ["Quidem", "49"], ["Quis", "12"], ["Quo", "41"], ["Quod", "11"], ["Razor Leaf", "16"], ["Recusandae", "98"], ["Reiciendis", "55"], ["Repellat", "48"], ["Repellendus", "22"], ["Repellendus", "31"], ["Repudiandae", "62"], ["Rerum", "23"], ["Ricotta Stuffed Ravioli", "59"], ["Risotto with Seafood", "88"], ["Risotto with Seafood", "60"], ["Roar", "49"], ["Rock Throw", "94"], ["Rock Throw", "50"], ["Runic Affinity", "17"], ["Sed", "31"], ["Sed", "20"], ["Sequi", "79"], ["Sint", "63"], ["Sint", "76"], ["Skull Bash", "55"], ["Sky Attack", "19"], ["Souvlaki", "66"], ["Spike Cannon", "38"], ["Stinky Tofu", "93"], ["Suscipit", "16"], ["Swift", "86"], ["Swords Dance", "71"], ["Tacos", "52"], ["Take Down", "47"], ["Thunder Wave", "71"], ["Tiramisù", "99"], ["Tiramisù", "50"], ["Transform", "51"], ["Tuna Sashimi", "42"], ["Tuna Sashimi", "63"], ["Twineedle", "44"], ["Ut", "28"], ["Ut", "94"], ["Voluptate", "39"], ["Voluptatem", "94"], ["Voluptates", "56"], ["Waterfall", "81"], ["Withdraw", "56"]])
    end
  end

  describe "top_cat" do
    it "finds the name of the single cat who has the most toys and the number of toys" do
      expect(top_cat).to eq([["Jet", "35"]])
    end
  end

  describe "cheap_toys_and_their_cats" do
    it "finds the cheapest toys and all the cats that own that toy" do
      expect(cheap_toys_and_their_cats).to eq([
        ["Henry"],
        ["Johnie"],
        ["Johnie"],
        ["Marian"],
        ["Mayola"],
        ["Season"],
        ["Shirley"],
        ["Tad"],
    ])
    end
  end

  describe "cats_like_johnson" do
    it "finds all the cats with the same breed as `Johnson` the `Lavendar` cat" do
      expect(cats_like_johnson).to eq([
        ["Adan"],
        ["Alex"],
        ["Alfonzo"],
        ["Alona"],
        ["Angele"],
        ["Arturo"],
        ["Asa"],
        ["Brice"],
        ["Carlton"],
        ["Carmelina"],
        ["Cecila"],
        ["Chadwick"],
        ["Clora"],
        ["Concetta"],
        ["Connie"],
        ["Conrad"],
        ["Daniela"],
        ["Darell"],
        ["Darell"],
        ["Darline"],
        ["Denny"],
        ["Detra"],
        ["Dewitt"],
        ["Dominique"],
        ["Donnell"],
        ["Donte"],
        ["Edgar"],
        ["Elke"],
        ["Elliot"],
        ["Elroy"],
        ["Eric"],
        ["Everette"],
        ["Fausto"],
        ["Felix"],
        ["Fredericka"],
        ["Gavin"],
        ["Gayle"],
        ["Gerald"],
        ["Glen"],
        ["Griselda"],
        ["Guillermo"],
        ["Hannah"],
        ["Herbert"],
        ["Hong"],
        ["Hugh"],
        ["Jackie"],
        ["Jae"],
        ["Jamar"],
        ["Jamey"],
        ["Jamie"],
        ["Jarred"],
        ["Jerrod"],
        ["Johnson"],
        ["Jonathan"],
        ["Jonathon"],
        ["Josh"],
        ["Katy"],
        ["Kim"],
        ["King"],
        ["Kristofer"],
        ["Laila"],
        ["Lanell"],
        ["Laura"],
        ["Leslie"],
        ["Leslie"],
        ["Lorina"],
        ["Loyd"],
        ["Lucas"],
        ["Many"],
        ["Marcela"],
        ["Mariann"],
        ["Mary"],
        ["Mauricio"],
        ["Meaghan"],
        ["Miesha"],
        ["Miquel"],
        ["Myron"],
        ["Norberto"],
        ["Olive"],
        ["Omar"],
        ["Parthenia"],
        ["Phoebe"],
        ["Prince"],
        ["Quinton"],
        ["Regine"],
        ["Reid"],
        ["Reiko"],
        ["Rey"],
        ["Riley"],
        ["Roberto"],
        ["Roland"],
        ["Romeo"],
        ["Ronny"],
        ["Roxana"],
        ["Rudolf"],
        ["Rupert"],
        ["Sage"],
        ["Shameka"],
        ["Shanice"],
        ["Shaunna"],
        ["Steven"],
        ["Sung"],
        ["Sunni"],
        ["Tonisha"],
        ["Trinidad"],
        ["Virginia"],
        ["Vito"],
        ["Wilber"],
        ["Willard"],
        ["William"],
        ["Wynell"],
        ["Xavier"]
    ])
    end
  end

  describe "most_expensive_shiny_mouse" do
    it "lists the name and price of all the toys with the same price as most expensive `Shiny Mouse`" do
      expect(most_expensive_shiny_mouse).to eq([["Acid", "53"], ["Agility", "53"], ["Aliquam", "53"], ["Anlong", "53"], ["Arepas", "53"], ["Arepas", "53"], ["Arepas", "53"], ["At", "53"], ["Atque", "53"], ["Aut", "53"], ["Bite", "53"], ["Bruschette with Tomato", "53"], ["Caesar Salad", "53"], ["Cauliflower Penne", "53"], ["Chicken Wings", "53"], ["Clarity", "53"], ["Commodi", "53"], ["Corporis", "53"], ["Counter", "53"], ["Cumque", "53"], ["Delectus", "53"], ["Delectus", "53"], ["Demacia", "53"], ["Dolor", "53"], ["Dolores", "53"], ["Dolores", "53"], ["Doloribus", "53"], ["Doloribus", "53"], ["Dream Eater", "53"], ["Drill Peck", "53"], ["Ducimus", "53"], ["Ea", "53"], ["Ebiten maki", "53"], ["Ebiten maki", "53"], ["Ember", "53"], ["Eos", "53"], ["Eos", "53"], ["Error", "53"], ["Est", "53"], ["Et", "53"], ["Et", "53"], ["Et", "53"], ["Eum", "53"], ["Excepturi", "53"], ["Facere", "53"], ["Fire Spin", "53"], ["Fissure", "53"], ["French Toast", "53"], ["Fugiat", "53"], ["Germanium", "53"], ["Hassium", "53"], ["Headbutt", "53"], ["High Jump Kick", "53"], ["High Possil", "53"], ["Hyper Fang", "53"], ["Impedit", "53"], ["In", "53"], ["In", "53"], ["Ipsa", "53"], ["Ipsam", "53"], ["Laudantium", "53"], ["Minus", "53"], ["Mist", "53"], ["Modi", "53"], ["Natus", "53"], ["Necessitatibus", "53"], ["Nihil", "53"], ["Nitrogen", "53"], ["Non", "53"], ["Nostrum", "53"], ["Odio", "53"], ["Odit", "53"], ["Omnis", "53"], ["Pappardelle alla Bolognese", "53"], ["Peking Duck", "53"], ["Perferendis", "53"], ["Philadelphia Maki", "53"], ["Pierogi", "53"], ["Pizza", "53"], ["Pork Sausage Roll", "53"], ["Praesentium", "53"], ["Praesentium", "53"], ["Quaerat", "53"], ["Qui", "53"], ["Qui", "53"], ["Qui", "53"], ["Quia", "53"], ["Quia", "53"], ["Quia", "53"], ["Quia", "53"], ["Razor Wind", "53"], ["Rem", "53"], ["Rem", "53"], ["Rem", "53"], ["Reprehenderit", "53"], ["Rerum", "53"], ["Rerum", "53"], ["Sapiente", "53"], ["Sed", "53"], ["Sequi", "53"], ["Shadow Moses Island", "53"], ["Souvlaki", "53"], ["Stinky Tofu", "53"], ["String Shot", "53"], ["Struggle", "53"], ["Sunt", "53"], ["Sushi", "53"], ["Tacos", "53"], ["Tamdakht", "53"], ["Teriyaki Chicken Donburi", "53"], ["Thunder Wave", "53"], ["Thunderbolt", "53"], ["Tiramisù", "53"], ["To the King!", "53"], ["Ullam", "53"], ["Unde", "53"], ["Ut", "53"], ["Vegetable Soup", "53"], ["Vitae", "53"], ["Voluptas", "53"], ["Voluptatem", "53"], ["Voluptatibus", "53"], ["Voluptatum", "53"], ["Wingardium Leviosa", "53"], ["Wrap", "53"], ["XSB", "53"]])
    end
  end

end
