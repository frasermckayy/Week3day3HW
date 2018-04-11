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

  def self.all()
    sql = "SELECT * FROM albums;"
    album = SqlRunner.run(sql)
    return album.map{|album| self.new(album)}
  end

end
