namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Admin User",
                         email: "admin@spectre.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    admin.toggle!(:activated)
    4.times do |n|
      name = Faker::Name.name
      email = "user-#{n+1}@spectre.com"
      password = "password"
      user = User.create!(name: name,
                          email: email,
                          password: password,
                          password_confirmation: password)
      user.toggle!(:activated)
    end

    users = User.all(limit: 3)
    50.times do
      # desc = Faker::Lorem.sentence(5)
      users.each { |user| user.actions.create!(desc: "signed out",
                                               type: "SignOut") }
    end
  end
end