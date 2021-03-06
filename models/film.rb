require_relative ("../db/sql_runner.rb")
require_relative ("customer.rb")

class Film
attr_reader :id
attr_accessor :title, :price

  def initialize(options)
    @id = options["id"].to_i()
    @title = options["title"]
    @price = options["price"].to_i()
  end

  def save()
    sql = "INSERT INTO films ( title, price )
          VALUES ( $1, $2 )
          RETURNING id
          "
    values = [@title, @price]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    results = SqlRunner.run(sql, values)
    film_details = results.map{ |film| Film.new(film)}
    return film_details
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
      sql = "UPDATE films
              SET (title, price) = ($1, $2)
              WHERE id = $3
      "
      values = [@title, @price]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.* FROM customers
          INNER JOIN tickets
          ON customers.id = tickets.customer_id
          WHERE film_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    customers = results.map{|customer|Customer.new(customer)}
    return customers
  end





end
