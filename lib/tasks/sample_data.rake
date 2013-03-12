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

    admin = User.create!(name: "Sam Jones",
                         email: "jones@yourcompany.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    admin.toggle!(:activated)

    user = User.create!(name: "Julie Anderson",
                        email: "anderson@yourcompany.com",
                        password: "foobar",
                        password_confirmation: "foobar")
    user.toggle!(:activated)

    layering = { type: "BidLayeringCase",
                 name: "Layering on the bid",
                 detection_time: DateTime.new(2013, 2, 28, 10, 47, 11).iso8601,
                 participants: "Acme Trading",
                 content: [
                   {
                    "sender-comp-id" => "VENUE_X",
                    "target-sub-id" => "CUSTOMER_X",
                    "leaves-qty" => 100,
                    "last-share" => 0,
                    "price" => 1.0,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:03",
                    "order-status" => "new",
                    "last-price" => 0.0,
                    "side" => "buy",
                    "order-qty" => 100,
                    "symbol" => "SANp",
                    "order-type" => "limit",
                    "customer-name" => "Acme Trading",
                    "order-id" => "2499",
                    "cumulative-qty" => 0,
                    "client-order-id" => "10471028480",
                    "target-comp-id" => "CUSTOMER"
                  },
                  {
                    "sender-comp-id" => "VENUE_X",
                    "target-sub-id" => "CUSTOMER_X",
                    "leaves-qty" => 100,
                    "last-share" => 0,
                    "price" => 1.01,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:04",
                    "order-status" => "new",
                    "last-price" => 0.0,
                    "side" => "buy",
                    "order-qty" => 100,
                    "symbol" => "SANp",
                    "order-type" => "limit",
                    "customer-name" => "Acme Trading",
                    "order-id" => "2500",
                    "cumulative-qty" => 0,
                    "client-order-id" => "10471028481",
                    "target-comp-id" => "CUSTOMER"
                  },
                  {
                    "sender-comp-id" => "VENUE_X",
                    "target-sub-id" => "CUSTOMER_X",
                    "leaves-qty" => 100,
                    "last-share" => 0,
                    "price" => 1.02,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:05",
                    "order-status" => "new",
                    "last-price" => 0.0,
                    "side" => "buy",
                    "order-qty" => 100,
                    "symbol" => "SANp",
                    "order-type" => "limit",
                    "customer-name" => "Acme Trading",
                    "order-id" => "2501",
                    "cumulative-qty" => 0,
                    "client-order-id" => "10471028482",
                    "target-comp-id" => "CUSTOMER"
                  },
                  {
                    "sender-comp-id" => "VENUE_X",
                    "target-sub-id" => "CUSTOMER_X",
                    "leaves-qty" => 100,
                    "last-share" => 0,
                    "price" => 1.03,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:06",
                    "order-status" => "new",
                    "last-price" => 0.0,
                    "side" => "buy",
                    "order-qty" => 100,
                    "symbol" => "SANp",
                    "order-type" => "limit",
                    "customer-name" => "Acme Trading",
                    "order-id" => "2502",
                    "cumulative-qty" => 0,
                    "client-order-id" => "10471028483",
                    "target-comp-id" => "CUSTOMER"
                   },
                   {
                    "sender-comp-id" => "VENUE_X",
                    "target-sub-id" => "CUSTOMER_X",
                    "leaves-qty" => 0,
                    "liquidity-flag" => "added",
                    "last-share" => 100,
                    "price" => 1.04,
                    "avg-price" => 1.04,
                    "transact-time" => "20130228-10:47:07",
                    "order-status" => "filled",
                    "last-price" => 1.04,
                    "side" => "sell",
                    "order-qty" => 100,
                    "symbol" => "SANp",
                    "order-type" => "limit",
                    "customer-name" => "Acme Trading",
                    "order-id" => "2503",
                    "cumulative-qty" => 100,
                    "client-order-id" => "10471028479",
                    "target-comp-id" => "CUSTOMER"
                  },
                  {
                    "sender-comp-id" => "VENUE_X",
                    "target-sub-id" => "CUSTOMER_X",
                    "leaves-qty" => 0,
                    "last-share" => 0,
                    "price" => 1.03,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:08",
                    "order-status" => "canceled",
                    "last-price" => 0.0,
                    "side" => "buy",
                    "order-qty" => 100,
                    "symbol" => "SANp",
                    "order-type" => "limit",
                    "customer-name" => "Acme Trading",
                    "order-id" => "2502",
                    "cumulative-qty" => 0,
                    "client-order-id" => "10471028483",
                    "target-comp-id" => "CUSTOMER"
                  },
                  {
                    "sender-comp-id" => "VENUE_X",
                    "target-sub-id" => "CUSTOMER_X",
                    "leaves-qty" => 0,
                    "last-share" => 0,
                    "price" => 1.02,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:09",
                    "order-status" => "canceled",
                    "last-price" => 0.0,
                    "side" => "buy",
                    "order-qty" => 100,
                    "symbol" => "SANp",
                    "order-type" => "limit",
                    "customer-name" => "Acme Trading",
                    "order-id" => "2501",
                    "cumulative-qty" => 0,
                    "client-order-id" => "10471028482",
                    "target-comp-id" => "CUSTOMER"
                  },
                  {
                    "sender-comp-id" => "VENUE_X",
                    "target-sub-id" => "CUSTOMER_X",
                    "leaves-qty" => 0,
                    "last-share" => 0,
                    "price" => 1.01,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:10",
                    "order-status" => "canceled",
                    "last-price" => 0.0,
                    "side" => "buy",
                    "order-qty" => 100,
                    "symbol" => "SANp",
                    "order-type" => "limit",
                    "customer-name" => "Acme Trading",
                    "order-id" => "2500",
                    "cumulative-qty" => 0,
                    "client-order-id" => "10471028481",
                    "target-comp-id" => "CUSTOMER"
                  },
                  {
                    "sender-comp-id" => "VENUE_X",
                    "target-sub-id" => "CUSTOMER_X",
                    "leaves-qty" => 0,
                    "last-share" => 0,
                    "price" => 1.0,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:11",
                    "order-status" => "canceled",
                    "last-price" => 0.0,
                    "side" => "buy",
                    "order-qty" => 100,
                    "symbol" => "SANp",
                    "order-type" => "limit",
                    "customer-name" => "Acme Trading",
                    "order-id" => "2499",
                    "cumulative-qty" => 0,
                    "client-order-id" => "10471028480",
                    "target-comp-id" => "CUSTOMER"
                  }
                ].to_json()
              }

    user = User.first
    case_file = user.case_files.create!(
      type: layering[:type],
      name: layering[:name],
      content: layering[:content],
      detection_time: layering[:detection_time],
      participants: layering[:participants])

    user.actions.create!(
      type: "Generate",
      desc: "Spectre generated case #{case_file.id} and assigned it to " +
            "#{ user.name }",
      content: "Generate action",
      case_file_id: case_file.id)

    IncidentMonitor.create!(
      type: "BidLayeringMonitor",
      desc: { "name" => "Layering on the bid",
              "info" => "Layering incidents are partitioned by participant and symbol"
            }.to_json(),
      settings: {
        "number-of-new-bids" => 4,
        "number-of-cancels" => 4,
        "bid-prices-must-be-in-increasing-order" => false,
        "length-of-monitoring-window" => 5
      }.to_json,
      active: true
    )
  end
end