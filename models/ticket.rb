require_relative("../db/sql_runner")

#template find and replace
# tablename = tickets
# classname capitalize = Ticket
# first variable = customer_id
# second varible = film_id
# third variable =
# code .to_i for relevant variables in initialize that are integers
class Ticket


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']
  end
#create
  def save()
    sql = "INSERT INTO tickets
    (
      customer_id,
      film_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [  @customer_id,
                @film_id
                ]
    visit = SqlRunner.run( sql,values ).first
    @id = visit['id'].to_i
    deduct_film_fee_from_customer
  end

  def deduct_film_fee_from_customer
      sql = "SELECT * FROM tickets
            FULL JOIN customers
            ON customer_id = customers.id
            FULL JOIN films
            ON film_id = films.id
            WHERE tickets.id = $1"
            values = [@id]
        query = SqlRunner.run(sql,values).first()
        new_funds = query['funds'].to_i - query['price'].to_i
        update_customer_funds(query['customer_id'],new_funds)
  end

  def update_customer_funds(id,funds)
      sql = "UPDATE customers SET funds = $1
            WHERE id = $2"
      values = [funds,@id]
      SqlRunner.run(sql,values)
  end
#read all
  def Ticket.all()
    sql = "SELECT * FROM tickets"
    query = SqlRunner.run(sql,[])
    return nil if query.first == nil
    return query.map { |value| tickets.new( value ) }
  end
  #find by id
    def Ticket.find_by_id(id)
        sql = "SELECT * FROM tickets WHERE id = $1"
        values = [id]
        query = SqlRunner.run(sql,value)
        return nil if query.first == nil
        return Ticket.new(query)
    end
#delete all
  def Ticket.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql,[])
  end

#delete by id
  def Ticket.delete_by_id(id)
      sql = "DELETE * FROM tickets WHERE id = $1"
      values = [id]
      query = SqlRunner.run(sql,value)
  end

  def Ticket.update_by_id()
      sql = "UPDATE Ticket SET (customer_id,film_id) = ($1,$2,$3) WHERE id= $4"
      values = [customer_id,film_id,@id]
      SqlRunner.run(sql,value)
  end
end
