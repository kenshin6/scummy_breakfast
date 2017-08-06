User.create!(name: "Dummy User",
             email: "dummy@example.com",
             password:              "foobarfoo",
             password_confirmation: "foobarfoo",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

20.times do |n|
  name = Faker::Name.name
  email = "dummy#{n+1}@example.com"
  password = "foobarfoo"
  User.create!(name: name,
               email: email,
               password:               "foobarfoo",
               password_confirmation:  "foobarfoo",
               activated: true,
               activated_at: Time.zone.now)

end
  
users = User.order(:created_at).take(6)
5.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end
