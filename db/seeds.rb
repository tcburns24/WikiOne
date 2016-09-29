require 'faker'

5.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
end

users = User.all


10.times do
  Wiki.create!(
  title: Faker::Hipster.sentence(4),
  body: Faker::Hipster.paragraph(5),
  private: false
  )
end

wikis = Wiki.all


puts "seeding finished."
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."
