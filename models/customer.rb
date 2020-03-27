require_relative("../db/sql_runner")

#template find and replace
# tablename = customers
# classname capitalize = Customer
# first variable = >charlie<
# second varible = name
# third variable = funds
# code .to_i for relevant variables in initialize that are integers
class Customer


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end
#create
  def save()
    sql = "INSERT INTO customers
    (

      name,
      funds
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
  #find by id
    def Customer.find_by_id(id)
        sql = "SELECT * FROM customers WHERE id = $1"
        values = [id]
        query = SqlRunner.run(sql,value)
        return nil if query.first == nil
        return Film.new(query)
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

  def Customer.update_by_id()
      sql = "UPDATE Customer SET (name,funds) = ($1,$2,$3) WHERE id= $4"
      values = [name,funds,@id]
      SqlRunner.run(sql,value)
  end
end
