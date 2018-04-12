require ('pg')
require_relative('./album.rb')
require_relative('../db/sql_runner.rb')

class Artist
  attr_reader :id, :name, :genre, :age

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @genre = options["genre"]
    @age = options["age"]

  end

  def save()
    sql = "INSERT INTO artists (name, genre, age) VALUES ($1, $2, $3) RETURNING id;"
    values = [@name, @genre, @age]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run(sql)
    return result.map {|result| self.new(result)}
  end

  def album()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    album = SqlRunner.run(sql, values)
    result = Album.new(album[0])
    return result
  end

  def update()
    sql = "UPDATE artists SET name = $1, genre = $2, age = $3 WHERE id = $4"
    values = [@name, @genre, @age, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result
  end

end
