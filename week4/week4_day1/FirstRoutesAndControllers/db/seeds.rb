# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.create(username: Faker::Name.name)
user2 = User.create(username: Faker::Name.name)
user3 = User.create(username: Faker::Name.name)
user4 = User.create(username: Faker::Name.name)
user5 = User.create(username: Faker::Name.name)

artwork1 = Artwork.create(title: Faker::Movie.quote,
            image_url: "https://s-media-cache-ak0.pinimg.com/originals/75/4c/7e/754c7e41f683ef639e73b6445387c6bd.jpg",
            artist_id: user1.id)
artwork2 = Artwork.create(title: Faker::Movie.quote,
            image_url: "https://s-media-cache-ak0.pinimg.com/736x/a0/00/f1/a000f11a9ef3121874d0b107fb6f09cd--funny-animal-memes-funny-memes.jpg",
            artist_id: user2.id)
artwork3 = Artwork.create(title: Faker::Movie.quote,
            image_url: "http://www.bajiroo.com/wp-content/uploads/2013/06/funny-dude-toasters-meme.jpg",
            artist_id: user1.id)
artwork4 = Artwork.create(title: Faker::Movie.quote,
            image_url: "https://s-media-cache-ak0.pinimg.com/originals/b4/63/d3/b463d307db5bcdfecdc35f1c56658cd7.jpg",
            artist_id: user3.id)
artwork5 = Artwork.create(title: Faker::Movie.quote,
            image_url: "http://rs455.pbsrc.com/albums/qq277/yourcoloriwonder/Funny/a931409e9eeaa50af847eb18daaa4ff1.gif~c200",
            artist_id: user2.id)

ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user1.id)
ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user1.id)
ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user2.id)
ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user3.id)
ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user3.id)
ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user4.id)
ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user4.id)
ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user5.id)
ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user5.id)
ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user5.id)
ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user3.id)
