require_relative("../db/sql_runner.rb")

class Customer
attr_reader :id
attr_accessor :name, :funds

  def initialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
    @funds = options["funds"].to_i()
  end

    def save()
      sql = "INSERT INTO customers ( name, funds )
      VALUES ($1, $2 )
      RETURNING id
      "
      values = [@name, @funds]
      customer = SqlRunner.run(sql, values).first()
      @id = customer["id"].to_i()
    end

    def self.all()
      sql = "SELECT * FROM customers"
      values = []
      results = SqlRunner.run(sql, values)
      customers = results.map{ |customer| Customer.new(customer)}
      return customers
    end

    def self.delete_all()
      sql = "DELETE FROM customers"
      values = []
      SqlRunner.run(sql, values)
    end

    def update()
        sql = "UPDATE bounties
                SET (name, species, bounty_value, danger_level) = ($1, $2, $3, $4)
                WHERE id = $5
        "
        values = [@name, @species, @bounty_value, @danger_level, @id]
        SqlRunner.run(sql, values)
    end






end
