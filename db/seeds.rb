# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(first_name: "M",last_name:"Zahid", email: "admin@gmail.com",password: "adminrole",phone_number: 1234567,status: 1, role: 2)

all_countries=JSON.parse(File.read(Rails.root.join('db/countries.json')))
all_countries.each do |c|
    # debugger
    Country.create!(name:c['name'],continent:c['region'],currency:c['currency'],phone_code:c['phone_code'],capital:c['capital'])
end


all_states=JSON.parse(File.read(Rails.root.join('db/states.json')))
all_states.each do |c|
    State.create!(name:c['name'],country_name:c['country_name'],country_id:c['country_id'])
end


all_cites=JSON.parse(File.read(Rails.root.join('db/cities.json')))
all_cites.each do |c|
    City.create!(name:c['name'],state_name:c['state_name'],country_id:c['country_id'],state_id:c['state_id'])
end




