require_relative("../db/sql_runner")

class Ticket

    attr_reader :id, :customer_id, :screening_id

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @customer_id = options['customer_id'].to_i
        @screening_id = options['screening_id'].to_i
    end
        #create & deduct film.price from customer.funds
    def save()
        sql = "INSERT INTO tickets
        (
          customer_id,
          screening_id
        )
        VALUES
        (
          $1, $2
        )
        RETURNING id"
        values = [@customer_id, @screening_id]
        visit = SqlRunner.run(sql,values).first
        @id = visit['id'].to_i
        deduct_film_fee_from_customer()
    end
        #return all child table information from id
    def deduct_film_fee_from_customer
        sql =    "SELECT * FROM tickets
                  FULL JOIN customers
                  ON customer_id = customers.id
                  FULL JOIN screenings
                  ON screening_id = screening.id
                  FULL JOIN films
                  ON film_id = film.id
                  WHERE tickets.id = $1"
        values = [@id]
        query = SqlRunner.run(sql,values).first()
        p query
        new_funds = query['funds'].to_i - query['price'].to_i
        update_customer_funds(query['customer_id'],new_funds)
    end
        #update customer records of ticket price deduction
    def update_customer_funds(id,funds)
        sql =   "UPDATE customers SET funds = $1
                 WHERE id = $2"
        values = [funds,id]
        SqlRunner.run(sql,values)
    end
        #read all
    def Ticket.all()
        sql = "SELECT * FROM tickets"
        query = SqlRunner.run(sql,[])
        return nil if query.first == nil
        return query.map { |value| tickets.new( value ) }
    end
        #Read by id
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
        sql = "UPDATE Ticket SET (customer_id,screening_id) = ($1,$2,$3) WHERE id= $4"
        values = [customer_id,screening_id,@id]
        SqlRunner.run(sql,value)
    end
end
