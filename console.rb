require_relative('models/artist.rb')
require_relative('models/album.rb')
require('pry-byebug')


Album.delete_all()
Artist.delete_all()



artist1 = Artist.new({
"name" => "Roberto",
"genre" => "Funk",
"age" => "39"
})

artist1.save()

artist2 = Artist.new({
"name" => "Fraz",
"genre" => "Rap",
"age" => "22"
})

artist2.save()


artist3 = Artist.new({
"name" => "Upul",
"genre" => "Death Metal",
"age" => "30"
})

artist3.save()

album1 = Album.new({
"album_name" => "The Trick",
"song_title" => "Amazing",
"artist_id" => artist1.id
})
album1.save()

album2 = Album.new({
  "album_name" => "Reputation",
  "song_title" => "Everything",
  "artist_id" => artist1.id
  })
  album2.save()

  album3 = Album.new({
    "album_name" => "Rage against the Code",
    "song_title" => "24/7",
    "artist_id" => artist1.id
    })




album3.save()


binding.pry()
nil
