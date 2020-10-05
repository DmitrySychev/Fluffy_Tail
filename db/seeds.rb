User.destroy_all
Pet.destroy_all
Location.destroy_all
Favorite.destroy_all

require 'csv'




20.times do
User.create(name: Faker::Name.name, password: rand(123456..6123456).to_s, email:Faker::Internet.email)
end

# locations = 
Location.create(name: "Manhattan", address: "1120 Broadway New York, NY 10011", phone: rand(1234567890..9234567899))
Location.create(name: "Brooklyn", address: "4231 Flatbush Ave Brooklyn, NY 11234", phone: rand(1234567890..9234567899))
Location.create(name: "Queens", address: "231 Queens Boulevard Queens, NY 11102", phone: rand(1234567890..9234567899))
Location.create(name: "Staten Island", address: "1413 Victory Blvd Staten Island, NY 10304", phone: rand(1234567890..9234567899))
Location.create(name: "Bronx", address: "1416 Nereid Ave Bronx, NY 10467", phone: rand(1234567890..9234567899))
Location.create(name: "New Jersey", address: "2416 Park Ave Weekhawken, NJ 07086", phone: rand(1234567890..9234567899))
Location.create(name: "Long Island", address: "2358 Main Ave Garden City, NY 11530", phone: rand(1234567890..9234567899))


# byebug


csv_text = File.read(Rails.root.join('lib', 'seeds', 'pets.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.first(21).each do |row|
  p = Pet.find_or_initialize_by(name: row['Raw_Name'].split(',').first )
  p.breed = row['Breed']
  p.age = row['Age']
  p.location = Location.all.sample
  p.img_url = row['Img_Url1']
  p.img_url2 = row['Img_Url2']
  p.description = row['Description']
  p.gender = row['Gender']
  p.animal_type = row['Animal_Type']
  p.save
end


# 40.times do
# Pet.create(name:Faker::Creature::Cat.name, age: rand(0..15), animal_type: Faker::Creature::Animal.name, breed: Faker::Creature::Dog.breed, img_url: "https://www.mercurynews.com/wp-content/uploads/2019/01/GettyImages-531306536.jpg", location_id: Location.all.sample.id)
# end

20.times do
Favorite.create(user_id: User.all.sample.id, pet_id: Pet.all.sample.id)
end
