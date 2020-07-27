# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'taro', email: 'taro@gmail.com', password_digest: 'taro')

(1..10).each do |num|
  Artist.create(user_id: 1, name: 'test' + num.to_s, description: 'testdescription' + num.to_s)
  ArtistGenre.create(artist_id: num, genre_id: 1)
  ArtistGenre.create(artist_id: num, genre_id: 2)
  ArtistFeeling.create(artist_id: num, feeling_id: rand(1..4))
end

(11..20).each do |num|
  Artist.create(user_id: 1, name: 'test' + num.to_s, description: 'testdescription' + num.to_s)
  ArtistGenre.create(artist_id: num, genre_id: 1)
  ArtistGenre.create(artist_id: num, genre_id: 2)
  ArtistFeeling.create(artist_id: num, feeling_id: rand(1..4))
end

(21..30).each do |num|
  Artist.create(user_id: 1, name: 'test' + num.to_s, description: 'testdescription' + num.to_s)
  ArtistGenre.create(artist_id: num, genre_id: 1)
  ArtistGenre.create(artist_id: num, genre_id: 2)
  ArtistFeeling.create(artist_id: num, feeling_id: rand(1..4))
end



