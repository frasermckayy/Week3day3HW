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

  def self.all()
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run(sql)
    return result.map {|result| self.new(result)}
  end





end
