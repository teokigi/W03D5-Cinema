require_relative("../db/sql_runner")

class Film

    attr_accessor :title, :price
    attr_reader :id

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @price = options['price'].to_i
    end
        #create
    def save()
        sql = "INSERT INTO films
        (
            title, price
        )
        VALUES
        (
            $1, $2
        )
        RETURNING id"
        values = [  @title,
                    @price]
        visit = SqlRunner.run( sql,values ).first
        @id = visit['id'].to_i
    end
        #read all
    def Film.all()
        sql = "SELECT * FROM films"
        query = SqlRunner.run(sql,[])
        return nil if query.first == nil
        return query.map { |value| films.new( value ) }
    end
        #find by id
    def Film.find_by_id(id)
        sql = "SELECT * FROM films WHERE id = $1"
        values = [id]
        query = SqlRunner.run(sql,value)
        return nil if query.first == nil
        return Film.new(query)
    end
        #Customers who have viewed this film
    def Film.customers_by_film(id)
        sql =   "SELECT customers.name FROM customers
                INNER JOIN tickets
                ON customer.id = customer_id
                WHERE film_id = $1"
        values = [id]
        query = SqlRunner.run(sql,values)
        return query.map{|customer|customer['name']}
    end
        #delete all
    def Film.delete_all()
        sql = "DELETE FROM films"
        SqlRunner.run(sql,[])
    end
        #delete by id
    def Film.delete_by_id(id)
        sql = "DELETE * FROM films WHERE id = $1"
        values = [id]
        query = SqlRunner.run(sql,value)
    end

    def Film.update_by_id()
        sql = "UPDATE Film SET (title,price) = ($1,$2,$3) WHERE id= $4"
        values = [title,price,@id]
        SqlRunner.run(sql,value)
    end
end
