namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Oliver Szep",
                         email: "szep@quotemtf.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    admin.toggle!(:activated)

    user = User.create!(name: "Nitin Punjabi",
                        email: "punjabi@quotemtf.com",
                        password: "foobar",
                        password_confirmation: "foobar")
    user.toggle!(:activated)

    layering = { type: "Layering",
                 detection_time: Time.now.utc.iso8601,
                 content: {
                   participants: "Acme Trading, Swindle Financial",
                   orders: [
                     { client_order_id: "001", symbol: "NESNz", price: "1.00",
                       side: "buy", status: "new"},
                     { client_order_id: "002", symbol: "NESNz", price: "1.01",
                       side: "buy", status: "new" },
                     { client_order_id: "003", symbol: "NESNz", price: "1.02",
                       side: "buy", status: "new" },
                     { client_order_id: "004", symbol: "NESNz", price: "1.04",
                       side: "sell", status: "filled" },
                     { client_order_id: "003", symbol: "NESNz", price: "1.02",
                       side: "buy", status: "canceled" },
                     { client_order_id: "002", symbol: "NESNz", price: "1.01",
                       side: "buy", status: "canceled" },
                     { client_order_id: "001", symbol: "NESNz", price: "1.00",
                       side: "buy", status: "canceled" }
                   ]
                }.to_json()
              }

    case_file = CaseFile.create!(
      user_id: User.find(2)[:id],
      open: true,
      type: layering[:type],
      content: layering[:content],
      detection_time: layering[:detection_time])

    user.actions.create!(type: "Open", desc: "opened case #{case_file.id}", 
                         case_file_id: case_file.id)

    user.actions.create!(type: "Comment",
                         desc: "commented on case #{case_file.id}",
                         content: "Participants emailed. Awaiting reply.",
                         case_file_id: case_file.id)

    case_file = CaseFile.create!(
      user_id: admin.id,
      open: true,
      type: layering[:type],
      content: layering[:content],
      detection_time: layering[:detection_time])

    admin.actions.create!(type: "Open", desc: "opened case #{case_file.id}", 
                         case_file_id: case_file.id)


    7.times do |n|
      name = Faker::Name.name
      email = "user-#{n+1}@spectre.com"
      password = "password"
      user = User.create!(name: name,
                          email: email,
                          password: password,
                          password_confirmation: password)
      user.toggle!(:activated)
    end
    
    # users = User.all(limit: 4)
    # comment = Faker::Lorem.sentence(25)
    # request = "Please take a look at this and confirm the close request."
    # acts = [
    #   { type: "Comment", desc: "commented on", content: comment },
    #   { type: "Open", desc: "opened"},
    #   { type: "Close", desc: "closed" },
    #   { type: "Activate", desc: "activated the account belonging to"},
    #   { type: "Deactivate", desc: "deactivated the account belonging to"},
    #   { type: "Transfer", desc: "transferred", content: request},
    #   { type: "SignIn", desc: "signed-in. "},
    #   { type: "SignOut", desc: "signed-out. "}]
    # 50.times do
    #   users.each { |user| user.actions.create!(acts.sample) }
    # end
  end
end