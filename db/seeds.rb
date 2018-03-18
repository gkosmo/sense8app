# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Language.all.empty?
csv_text = File.read(Rails.root.join('db', 'data', 'Languages.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  Language.create(row.to_hash)
end
end

200.times do

user = User.new
user.email = Faker::Internet.email
user.password = '#$taawktljasktlw4aaglj'
user.encrypted_password = '#$taawktljasktlw4aaglj'
user.save!
profile = Profile.new(
    birth_place_latitude:  Faker::Address.latitude,
     birth_place_longitude:  Faker::Address.longitude,

   living_place_latitude:  Faker::Address.latitude,

   living_place_longitude:  Faker::Address.longitude,

   user: user,
    birth_place: Faker::Address.street_address ,
birth_date: Faker::Date.between(40.years.ago, 18.years.ago),
  nickname: Faker::Internet.user_name,
  living_place: Faker::Address.street_address ,
  gender: ["male","female", "other"].sample,
  gender_identity: ["male","female", "other"].sample,
  sexuality: Profile.sexualities.sample
 )
profile.save(validate: false)
user.profile = profile
user.save(validate: false)
end


20.times do
  p = Profile.all.sample
  p.birth_date = Date.parse('3 april 1986')
  p.save(validate: false)
end

Profile.all.each do |p|
Cluster.create_or_find_cluster(p)
end
