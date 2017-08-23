# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all

cat1 = Cat.create(birth_date: '1999/01/21', color: 'red', name: Faker::Food.dish,
                  sex: 'M', description: Faker::Cat.breed)
cat2 = Cat.create(birth_date: '2003/07/17', color: 'black', name: Faker::Food.dish,
                  sex: 'F', description: Faker::Cat.breed)
cat3 = Cat.create(birth_date: '2005/04/11', color: 'white', name: Faker::Food.dish,
                  sex: 'M', description: Faker::Cat.breed)
cat4 = Cat.create(birth_date: '1969/02/01', color: 'green', name: Faker::Food.dish,
                  sex: 'F', description: Faker::Cat.breed)
cat5 = Cat.create(birth_date: '2018/09/02', color: 'blue', name: Faker::Food.dish,
                  sex: 'F', description: Faker::Cat.breed)

CatRentalRequest.create(cat_id: cat1.id, start_date: '2017/8/14', end_date: '2017/8/28')
CatRentalRequest.create(cat_id: cat2.id, start_date: '2017/8/14', end_date: '2017/8/28', status: 'APPROVED')
