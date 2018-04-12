require ('pg')
require_relative('./artist.rb')
require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id, :album_name, :song_title

  def initialize(options)
    @id = options["id"].to_i
    @album_name = options["album_name"]
    @song_title = options["song_title"]
    @artist_id = options['artist_id']

  end


  def save()
    sql = "INSERT INTO albums (album_name, song_title, artist_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@album_name, @song_title, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.delete_all()
    sql ="DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    album = SqlRunner.run(sql)
    return album.map{|album| self.new(album)}
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artists = SqlRunner.run(sql, values)
    return artists.map{|band| Artist.new(band)}
  end

  def update()
   sql = "UPDATE albums SET album_name = $1, song_title = $2, artist_id = $3 WHERE id = $4"
   values = [@album_name, @kynansong_title, @artist_id, @id]
   SqlRunner.run(sql, values)
end

def self.find(id)
   sql ="SELECT * FROM albums WHERE id = $1"
   values = [id]
   result = SqlRunner.run(sql, values)
   return result
end

end
