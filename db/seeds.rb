require("pry")
require("pry-byebug")
require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/ticket.rb")

Film.delete_all()
Customer.delete_all()

customer_1 = Customer.new({ "name" => "Ronald Ragan", "funds" => 10})
customer_1.save()
customer_2 = Customer.new({ "name" => "Ben Benson", "funds" => 30})
customer_2.save()
customer_3 = Customer.new({ "name" => "Dawn Chorus", "funds" => 25})
customer_3.save()

film_1 = Film.new({ "title" => "Armgeddon", "price" => 8 })
film_1.save()
film_2 = Film.new({ "title" => "Goldfinger", "price" => 5 })
film_2.save()
film_3 = Film.new({ "title" => "Frozen", "price" => 8 })
film_3.save()

ticket_1 = Ticket.new({"customer_id" => customer_1.id, "film_id" => film_1.id })
ticket_1.save()
ticket_2 = Ticket.new({"customer_id" => customer_1.id, "film_id" => film_2.id })
ticket_2.save()
ticket_3 = Ticket.new({"customer_id" => customer_2.id, "film_id" => film_2.id })
ticket_3.save()

binding.pry
nil
