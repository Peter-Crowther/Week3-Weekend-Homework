require("pry")
require("pry-byebug")
require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/ticket.rb")

customer_1 = Customer.new({ "name" => "Ronald Ragan", "funds" => 10})
customer_1.save()

film_1 = Film.new({ "title" => "Armgeddon", "price" => 8 })

binding.pry
nil
