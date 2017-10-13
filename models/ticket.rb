require_relative("../db/sql_runner.rb")
require_relative("customer.rb")
require_relative("film.rb")

class Ticket
attr_reader :id
attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options["id"].to_i()
    @customer_id = options["customer_id"].to_i()
    @film_id = options["film_id"].to_i()
  end

  def save()
    sql = "INSERT INTO tickets(customer_id, film_id)
          VALUES( $1, $2)
          RETURNING id
          "
    values = [@customer_id, @film_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def film
    sql = "SELECT * FROM films
    WHERE id = $1"
    values = [@film_id]
    results = SqlRunner.run(sql, values)
    return Film.new(results[0])
  end

  def customer
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [@customer_id]
    results = SqlRunner.run(sql, values)
    return Customer.new(results[0])
  end
end
