require_relative("../db/sql_runner")

#template find and replace
# tablename = screenings
# classname capitalize = Screening
# first variable = >echo<
# second varible = >delta<
# third variable = >charlie<
# code .to_i for relevant variables in initialize that are integers
class Screening


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @>echo< = options['>echo<']
    @>delta< = options['>delta<']
    @>charlie< = options['>charlie<']
  end
#create
  def save()
    sql = "INSERT INTO screenings
    (
      >echo<,
      >delta<,
      >charlie<
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [  @>echo<,
                @>delta<,
                @>charlie<]
    visit = SqlRunner.run( sql,values ).first
    @id = visit['id'].to_i
  end
#read all
  def Screening.all()
    sql = "SELECT * FROM screenings"
    query = SqlRunner.run(sql,[])
    return nil if query.first == nil
    return query.map { |value| screenings.new( value ) }
  end
  #find by id
    def Screening.find_by_id(id)
        sql = "SELECT * FROM screenings WHERE id = $1"
        values = [id]
        query = SqlRunner.run(sql,value)
        return nil if query.first == nil
        return >bravo<.new(query)
    end
#delete all
  def Screening.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql,[])
  end

#delete by id
  def Screening.delete_by_id(id)
      sql = "DELETE * FROM screenings WHERE id = $1"
      values = [id]
      query = SqlRunner.run(sql,value)
  end

  def Screening.update_by_id()
      sql = "UPDATE Screening SET (>echo<,>delta<,>charlie<) = ($1,$2,$3) WHERE id= $4"
      values = [>echo<,>delta<,>charlie<,@id]
      SqlRunner.run(sql,value)
  end
end
