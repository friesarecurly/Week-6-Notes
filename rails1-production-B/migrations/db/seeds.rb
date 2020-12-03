# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def rand_id
  rand(1..100_000)
end

ActiveRecord::Base.transaction do
  Artist.delete_all
  User.delete_all
  Album.delete_all
  Playlist.delete_all
  Song.delete_all
  PlaylistTrack.delete_all

  ricky = User.create(
    id: rand_id,
    username: "ricky",
    password: "grade10"
  )

  aphex = Artist.create(
    id: rand_id,
    name: "Aphex Twin"
  )

  album1 = Album.create(
    id: rand_id,
    name: "Selected Ambient Works 85-92",
    year: 1992,
    artist_id: aphex.id
  )

  song1 = Song.create(
    id: rand_id,
    name: "Ptolemy",
    length: 434,
    album_id: album1.id
  )

  song2 = Song.create(
    id: rand_id,
    name: "Hedphelym",
    length: 363,
    album_id: album1.id
  )

  playlist1 = Playlist.create(
    id: rand_id,
    name: "Good Songs",
    user_id: ricky.id
  )

  track1 = PlaylistTrack.create(
    id: rand_id,
    playlist_id: playlist1.id,
    song_id: song1.id
  )

  track2 = PlaylistTrack.create(
    id: rand_id,
    playlist_id: playlist1.id,
    song_id: song2.id
  )

  
end