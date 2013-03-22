namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Oliver Szep",
                         email: "oliver@spectredemo.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    admin.toggle!(:activated)

    user = User.create!(name: "Nitin Punjabi",
                        email: "nitin@spectredemo.com",
                        password: "foobar",
                        password_confirmation: "foobar")
    user.toggle!(:admin)
    user.toggle!(:activated)

    admin = User.create!(name: "Walter White",
                         email: "walter@spectredemo.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    admin.toggle!(:activated)

    user = User.create!(name: "Julie Anderson",
                        email: "anderson@spectredemo.com",
                        password: "foobar",
                        password_confirmation: "foobar")
    user.toggle!(:activated)

    user = User.find_by_email("nitin@spectredemo.com")
    layer_bid= { type: "BidLayeringCase",
                 name: "Layering on the bid",
                 detection_time: DateTime.new(2013, 2, 28, 10, 47, 11).iso8601,
                 participants: "Acme Trading",
                 symbol: "SANp",
                 content: [
                   {
                    "sender-comp-id" => "VENUE_X",
                    "target-sub-id" => "CUSTOMER_X",
                    "leaves-qty" => 100,
                    "last-share" => 0,
                    "price" => 1.0,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:03",
                    "event-timestamp" => 1362044823000,
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
                    "event-timestamp" => 1362044824000,
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
                    "event-timestamp" => 1362044825000,
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
                    "event-timestamp" => 1362044826000,
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
                    "event-timestamp" => 1362044827000,
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
                    "event-timestamp" => 1362044828000,
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
                    "event-timestamp" => 1362044829000,
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
                    "event-timestamp" => 1362044830000,
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
                    "event-timestamp" => 1362044831000,
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

    case_file = user.case_files.create!(
      type: layer_bid[:type],
      name: layer_bid[:name],
      content: layer_bid[:content],
      detection_time: layer_bid[:detection_time],
      participants: layer_bid[:participants],
      symbol: layer_bid[:symbol])

    user.actions.create!(
      type: "Generate",
      desc: "Spectre generated case #{case_file.id} and assigned it to " +
            "#{ user.name }",
      content: "Generate action",
      case_file_id: case_file.id)

    layer_ask = { type: "AskLayeringCase",
                 name: "Layering on the ask",
                 detection_time: DateTime.new(2013, 2, 28, 10, 47, 11).iso8601,
                 participants: "Acme Trading",
                 symbol: "SANp",
                 content: [
                   {
                    "sender-comp-id" => "VENUE_X",
                    "target-sub-id" => "CUSTOMER_X",
                    "leaves-qty" => 100,
                    "last-share" => 0,
                    "price" => 1.04,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:03",
                    "event-timestamp" => 1362044823000,
                    "order-status" => "new",
                    "last-price" => 0.0,
                    "side" => "sell",
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
                    "price" => 1.03,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:04",
                    "event-timestamp" => 1362044824000,
                    "order-status" => "new",
                    "last-price" => 0.0,
                    "side" => "sell",
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
                    "event-timestamp" => 1362044825000,
                    "order-status" => "new",
                    "last-price" => 0.0,
                    "side" => "sell",
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
                    "price" => 1.01,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:06",
                    "event-timestamp" => 1362044826000,
                    "order-status" => "new",
                    "last-price" => 0.0,
                    "side" => "sell",
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
                    "price" => 1.00,
                    "avg-price" => 1.00,
                    "transact-time" => "20130228-10:47:07",
                    "event-timestamp" => 1362044827000,
                    "order-status" => "filled",
                    "last-price" => 1.00,
                    "side" => "buy",
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
                    "price" => 1.01,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:08",
                    "event-timestamp" => 1362044828000,
                    "order-status" => "canceled",
                    "last-price" => 0.0,
                    "side" => "sell",
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
                    "event-timestamp" => 1362044829000,
                    "order-status" => "canceled",
                    "last-price" => 0.0,
                    "side" => "sell",
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
                    "price" => 1.03,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:10",
                    "event-timestamp" => 1362044830000,
                    "order-status" => "canceled",
                    "last-price" => 0.0,
                    "side" => "sell",
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
                    "price" => 1.04,
                    "avg-price" => 0.0,
                    "transact-time" => "20130228-10:47:11",
                    "event-timestamp" => 1362044831000,
                    "order-status" => "canceled",
                    "last-price" => 0.0,
                    "side" => "sell",
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

    case_file = user.case_files.create!(
      type: layer_ask[:type],
      name: layer_ask[:name],
      content: layer_ask[:content],
      detection_time: layer_ask[:detection_time],
      participants: layer_ask[:participants],
      symbol: layer_ask[:symbol])

    user.actions.create!(
      type: "Generate",
      desc: "Spectre generated case #{case_file.id} and assigned it to " +
            "#{ user.name }",
      content: "Generate action",
      case_file_id: case_file.id)

    low_trade_to_cancel = { 
      type: "LowTradeToCancelRatioCase",
      name: "Low trade-to-cancel ratio",
      detection_time: DateTime.new(2013, 2, 28, 10, 47, 11).iso8601,
      participants: "Acme Trading",
      symbol: "SANp",
      content: {
        "fills" => 5,
        "cancels" => 40,
        "ratio" => 0.125,
        "symbol" => "SANp",
        "threshold" => 0.3,
        "monitoring-window" => "5"
       }.to_json()
    }

    case_file = user.case_files.create!(
      type: low_trade_to_cancel[:type],
      name: low_trade_to_cancel[:name],
      content: low_trade_to_cancel[:content],
      detection_time: low_trade_to_cancel[:detection_time],
      participants: low_trade_to_cancel[:participants],
      symbol: low_trade_to_cancel[:symbol])

    user.actions.create!(
      type: "Generate",
      desc: "Spectre generated case #{case_file.id} and assigned it to " +
            "#{ user.name }",
      content: "Generate action",
      case_file_id: case_file.id)

    wash_trading = { 
      type: "WashTradingCase",
      name: "Wash trading",
      detection_time: DateTime.new(2013, 2, 28, 10, 47, 11).iso8601,
      participants: "Acme Trading",
      symbol: "SANp",
      content: [
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
          "liquidity-flag" => "removed",
          "last-share" => 100,
          "price" => 1.04,
          "avg-price" => 1.04,
          "transact-time" => "20130228-10:47:07",
          "order-status" => "filled",
          "last-price" => 1.04,
          "side" => "buy",
          "order-qty" => 100,
          "symbol" => "SANp",
          "order-type" => "limit",
          "customer-name" => "Acme Trading",
          "order-id" => "2504",
          "cumulative-qty" => 100,
          "client-order-id" => "10471028480",
          "target-comp-id" => "CUSTOMER"
        }
      ].to_json()
    }

    case_file = user.case_files.create!(
      type: wash_trading[:type],
      name: wash_trading[:name],
      content: wash_trading[:content],
      detection_time: wash_trading[:detection_time],
      participants: wash_trading[:participants],
      symbol: wash_trading[:symbol])

    user.actions.create!(
      type: "Generate",
      desc: "Spectre generated case #{case_file.id} and assigned it to " +
            "#{ user.name }",
      content: "Generate action",
      case_file_id: case_file.id)

    large_unfilled_order = {
      type: "LargeUnfilledOrderCase",
      name: "Large unfilled order",
      detection_time: DateTime.new(2013, 2, 28, 10, 47, 11).iso8601,
      participants: "Acme Trading",
      symbol: "SANp",
      content: {
        "order" => {
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
          "order-qty" => 1000000,
          "symbol" => "SANp",
          "order-type" => "limit",
          "customer-name" => "Acme Trading",
          "order-id" => "2499",
          "cumulative-qty" => 0,
          "client-order-id" => "10471028480",
          "target-comp-id" => "CUSTOMER"
        },
        "avg-order-size" => 100
       }.to_json()
    }

    case_file = user.case_files.create!(
      type: large_unfilled_order[:type],
      name: large_unfilled_order[:name],
      content: large_unfilled_order[:content],
      detection_time: large_unfilled_order[:detection_time],
      participants: large_unfilled_order[:participants],
      symbol: large_unfilled_order[:symbol])

    user.actions.create!(
      type: "Generate",
      desc: "Spectre generated case #{case_file.id} and assigned it to " +
            "#{ user.name }",
      content: "Generate action",
      case_file_id: case_file.id)

    IncidentMonitor.create!(
      type: "BidLayeringMonitor",
      desc: { "name" => "Layering on the bid",
              "info" => "Submitting multiple orders on the buy side of the " +
                        "book to create a false sense of demand, which helps " +
                        "the participant execute a trade on the sell side " +
                        "(the true intention). Following the execution, the " +
                        "buy orders are rapidly removed. This monitor looks " +
                        "for a sequence of zero or more bids, followed by a sell " +
                        "execution, followed by one or more bid " +
                        "cancellations. Layering incidents are partitioned " +
                        "by participant and symbol."
            }.to_json(),
      settings: {
        "number-of-new-bids" => 4,
        "number-of-cancels" => 4,
        "bid-prices-must-be-in-increasing-order" => true,
        "length-of-monitoring-window" => 5
      }.to_json,
      active: true
    )

    IncidentMonitor.create!(
      type: "AskLayeringMonitor",
      desc: { "name" => "Layering on the ask",
              "info" => "Submitting multiple orders on the sell side of the " +
                        "book to create a false sense of supply, which helps " +
                        "the participant execute a trade on the buy side " +
                        "(the true intention). Following the execution, the " +
                        "sell orders are rapidly removed. This monitor looks " +
                        "for a sequence of zero or more asks, followed by a buy " +
                        "execution, followed by one or more ask " +
                        "cancellations. Layering incidents are partitioned " +
                        "by participant and symbol."
            }.to_json(),
      settings: {
        "number-of-new-asks" => 4,
        "number-of-cancels" => 4,
        "ask-prices-must-be-in-decreasing-order" => false,
        "length-of-monitoring-window" => 5
      }.to_json,
      active: true
    )

    IncidentMonitor.create!(
      type: "TradeToCancelRatioMonitor",
      desc: { "name" => "Low trade-to-cancel ratio",
              "info" => "This monitor looks for any incident where, within a " +
                        "specified time, a participant's number of trades vs " +
                        "its number of cancels on a symbol drop below a " +
                        "specified threshold. Layering incidents are partitioned " +
                        "by participant and symbol."
            }.to_json(),
      settings: {
        "alert-when-ratio-is-below" => 5,
        "length-of-monitoring-window" => 60
      }.to_json,
      active: true
    )

    IncidentMonitor.create!(
      type: "WashTradingMonitor",
      desc: { "name" => "Wash trading",
              "info" => "This monitor looks for any incident where a " +
                        "participant trades with itself without prior " +
                        "intention to internalize. Layering incidents are partitioned " +
                        "by participant and symbol."
            }.to_json(),
      settings: {
        "ignore-internalized-trades" => true
      }.to_json,
      active: true
    )

    IncidentMonitor.create!(
      type: "LargeUnfilledOrderMonitor",
      desc: { "name" => "Large unfilled order",
              "info" => "This monitor looks for any incident where a " +
                        "participant submits a large order, and then cancels " +
                        "it within a specified time with the remaining " +
                        "unfilled shares N times larger than the average " +
                        "order size for the symbol. Layering incidents are partitioned " +
                        "by participant and symbol."
            }.to_json(),
      settings: {
        "size-multiplier" => 10,
        "length-of-monitoring-window" => 5
      }.to_json,
      active: true
    )
  end
end