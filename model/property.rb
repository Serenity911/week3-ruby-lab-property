require('pg')

class Property

attr_reader :id
attr_accessor :address, :value, :number_of_bedrooms, :buy_let_status

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @address = options['address']
    @value = options['value'].to_i
    @number_of_bedrooms = options['number_of_bedrooms'].to_i
    @buy_let_status = options['buy_let_status']
  end

  def save()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "
    INSERT INTO properties (
      address,
      value,
      number_of_bedrooms,
      buy_let_status
    ) VALUES ($1, $2, $3, $4) RETURNING id;
    "
    values = [@address, @value, @number_of_bedrooms, @buy_let_status]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i
    db.close()
  end

  def Property.all()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "SELECT * FROM properties;"
    db.prepare("all", sql)
    unit = db.exec_prepared("all")
    db.close()
    return unit.map{|unit_hash| Property.new(unit_hash)}
  end

  def delete()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "DELETE FROM properties WHERE id = $1;"
    values = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close()
  end

  def Property.delete_all()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "DELETE FROM properties;"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql =
    "
    UPDATE properties SET (
      address,
      value,
      number_of_bedrooms,
      buy_let_status
    ) = ($1, $2, $3, $4)
    WHERE id = $5;
    "
    values = [@address, @value, @number_of_bedrooms, @buy_let_status, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def find()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "SELECT * FROM properties WHERE ID = $1;"
    values = [@id]
    db.prepare("find_by_id", sql)
    unit = db.exec_prepared("find_by_id", values)
    db.close()
    return Property.new(unit[0])
  end

end

# db = PG.connect({dbname: 'properties', host: 'localhost'})
# db.close()
