User.create!(name: "Dummy User",
             email: "dummy@example.com",
             password:              "foobarfoo",
             password_confirmation: "foobarfoo",
             admin: true)

20.times do |n|
  name = Faker::Name.name
  email = "dummy#{n+1}@example.com"
  password = "foobarfoo"
  User.create!(name: name,
               email: email,
               password:               "foobarfoo",
               password_confirmation:  "foobarfoo")
end
