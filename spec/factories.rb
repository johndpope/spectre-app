FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@spectre.com" }
    password "spectre"
    password_confirmation "spectre"
    activated true

    factory :admin do
      admin true
    end
  end

  factory :sign_in do
    desc "signed in"
    type "SignIn"
    content "SignIn action"
    user
  end

  factory :bid_layering_case do
    type "BidLayeringCase"
    name "Layering on the bid"
    content [
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
              }
            ].to_json()
    detection_time Time.now.utc.iso8601
    participants "Acme Trading"
    symbol "SANp"
    user
  end

  factory :ask_layering_case do
    type "AskLayeringCase"
    name "Layering on the ask"
    content [
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
                "side" => "buy",
                "order-qty" => 100,
                "symbol" => "SANp",
                "order-type" => "limit",
                "customer-name" => "Acme Trading",
                "order-id" => "2503",
                "cumulative-qty" => 100,
                "client-order-id" => "10471028479",
                "target-comp-id" => "CUSTOMER"
              }
            ].to_json()
    detection_time Time.now.utc.iso8601
    participants "Acme Trading"
    symbol "SANp"
    user
  end 

  factory :wash_trading_case do
    type "WashTradingCase"
    name "Wash trading"
    content [
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
                "side" => "buy",
                "order-qty" => 100,
                "symbol" => "SANp",
                "order-type" => "limit",
                "customer-name" => "Acme Trading",
                "order-id" => "2503",
                "cumulative-qty" => 100,
                "client-order-id" => "10471028479",
                "target-comp-id" => "CUSTOMER"
              }
            ].to_json()
    detection_time Time.now.utc.iso8601
    participants "Acme Trading"
    symbol "SANp"
    user
  end

  factory :large_unfilled_order_case do
    type "LargeUnfilledOrderCase"
    name "Large unfilled order"
    content Hash["order",
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
                    "order-qty" => 1000000,
                    "symbol" => "SANp",
                    "order-type" => "limit",
                    "customer-name" => "Acme Trading",
                    "order-id" => "2499",
                    "cumulative-qty" => 0,
                    "client-order-id" => "10471028480",
                    "target-comp-id" => "CUSTOMER"
                  },
                  "avg-order-size", 100].to_json()
    detection_time Time.now.utc.iso8601
    participants "Acme Trading"
    symbol "SANp"
    user
  end

  factory :low_trade_to_cancel_ratio_case do
    type "LowTradeToCancelRatioCase"
    name "Low trade-to-cancel ratio"
    content Hash["fills", 5,
                 "cancels", 40,
                 "ratio", 0.125,
                 "symbol", "SANp",
                 "threshold", 0.3,
                 "monitoring-window", 5].to_json()
    detection_time Time.now.utc.iso8601
    participants "Acme Trading"
    symbol "SANp"
    user
  end

  factory :rapid_price_change_case do
    type "RapidPriceChangeCase"
    name "Rapid price change"
    content [
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
              }
            ].to_json()
    detection_time Time.now.utc.iso8601
    participants "Acme Trading"
    symbol "SANp"
    user
  end

  factory :bid_layering_monitor do
    type "BidLayeringMonitor"
    desc Hash["name", "Layering on the bid",
              "info", "Layering on the bid description"].to_json
    settings Hash["number-of-new-bids", 4,
                  "number-of-cancels", 4,
                  "bids-should-be-in-increasing-order", true,
                  "length-of-monitoring-window", 5].to_json
    active true
  end

  factory :ask_layering_monitor do
    type "BidLayeringMonitor"
    desc Hash["name", "Layering on the bid",
              "info", "Layering on the bid description"].to_json
    settings Hash["number-of-new-bids", 4,
                  "number-of-cancels", 4,
                  "asks-should-be-in-decreasing-order", true,
                  "length-of-monitoring-window", 5].to_json
    active true
  end
end
