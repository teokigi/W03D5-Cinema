require_relative("../db/sql_runner")

class Customer

    attr_accessor :name, :funds
    attr_reader :id

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @funds = options['funds'].to_i
    end
        #create
    def save()
        sql = "INSERT INTO customers
        (
          name, funds
        )
        VALUES
        (
          $1, $2
        )
        RETURNING id"
        values = [
                    @name,
                    @funds]
        visit = SqlRunner.run( sql,values ).first
        @id = visit['id'].to_i
    end
        #read all
    def Customer.all()
        sql = "SELECT * FROM customers"
        query = SqlRunner.run(sql,[])
        return nil if query.first == nil
        return query.map { |value| customers.new( value ) }
    end
        #read by id
    def Customer.find_by_id(id)
        sql = "SELECT * FROM customers WHERE id = $1"
        values = [id]
        query = SqlRunner.run(sql,value)
        return nil if query.first == nil
        return Film.new(query)
    end
        #read all films by customer
    def Customer.films_by_customer(id)
        sql =   "SELECT films.title FROM films
                 INNER JOIN tickets
                 ON film_id = films.id
                 WHERE customer_id = $1"
        values = [id]
        query = SqlRunner.run(sql,values)
        return query.map{|film|film['title']}
    end
        #read all tickets by customer
    def Customer.all_tickets(id)
        sql = "SELECT count(id) FROM tickets
                WHERE customer_id = $1"
        values = [id]
        query = SqlRunner.run(sql,values).first
        return query['count']
    end
        #delete all
    def Customer.delete_all()
        sql = "DELETE FROM customers"
        SqlRunner.run(sql,[])
    end
        #delete by id
    def Customer.delete_by_id(id)
        sql = "DELETE * FROM customers WHERE id = $1"
        values = [id]
        query = SqlRunner.run(sql,value)
    end
        #update_by_id
    def Customer.update_by_id()
        sql = "UPDATE Customer SET (name,funds) = ($1,$2,$3) WHERE id= $4"
        values = [name,funds,@id]
        SqlRunner.run(sql,value)
    end
end
