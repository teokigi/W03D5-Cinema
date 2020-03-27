require_relative("../db/sql_runner")

#template find and replace
# tablename = >alpha<
# classname capitalize = >bravo<
# first variable = >charlie<
# second varible = >delta<
# third variable = >echo<
# code .to_i for relevant variables in initialize that are integers
class >bravo<


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @>charlie< = options['>charlie<']
    @>delta< = options['>delta<']
    @>echo< = options['>echo<']
  end
#create
  def save()
    sql = "INSERT INTO >alpha<
    (
      >charlie<,
      >delta<,
      >echo<
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [  @>charlie<,
                @>delta<,
                @>echo<]
    visit = SqlRunner.run( sql,values ).first
    @id = visit['id'].to_i
  end
#read all
  def >bravo<.all()
    sql = "SELECT * FROM >alpha<"
    query = SqlRunner.run(sql,[])
    return nil if query.first == nil
    return query.map { |value| >alpha<.new( value ) }
  end
  #find by id
    def >bravo<.find_by_id(id)
        sql = "SELECT * FROM >alpha< WHERE id = $1"
        values = [id]
        query = SqlRunner.run(sql,value)
        return nil if query.first == nil
        return >brao<.new(query)
    end
#delete all
  def >bravo<.delete_all()
    sql = "DELETE FROM >alpha<"
    SqlRunner.run(sql,[])
  end

#delete by id
  def >bravo<.delete_by_id(id)
      sql = "DELETE * FROM >alpha< WHERE id = $1"
      values = [id]
      query = SqlRunner.run(sql,value)
  end
end
