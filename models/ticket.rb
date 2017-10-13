class Ticket
attr_reader :id
attr_accessor :user_id, :film_id

  def initialize(options)
    @id = options["id"].to_i()
    @user_id = options["user_id"].to_i()
    @film_id = options["film_id"].to_i()
  end
end
