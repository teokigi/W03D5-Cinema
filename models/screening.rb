require_relative("../db/sql_runner")

#template find and replace
# tablename = screenings
# classname capitalize = Screening
# first variable = film_id
# second varible = showtime
# third variable = availability
# code .to_i for relevant variables in initialize that are integers
class Screening


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @showtime = options['showtime']
    @availability = options['availability'].to_i
    @sales = 0
  end
#create
  def save()
    sql = "INSERT INTO screenings
    (
      film_id,
      showtime,
      availability
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [  @film_id,
                @showtime,
                @availability]
    visit = SqlRunner.run(sql,values).first
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
        return Screening.new(query)
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
      sql = "UPDATE Screening SET (film_id,showtime,availability) = ($1,$2,$3) WHERE id= $4"
      values = [film_id,showtime,availability,@id]
      SqlRunner.run(sql,value)
  end
end
