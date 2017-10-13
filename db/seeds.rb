require("pry")
require("pry-byebug")
require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/ticket.rb")

user_1 = Customer.new({ "name" => "Ronald Ragan"})

film_1 = Film.new({ "title" => "Armgeddon", "price" => 8 })
