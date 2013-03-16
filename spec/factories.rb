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

  factory :bid_layering_monitor do
    type "BidLayeringMonitor"
    desc Hash["name", "Layering on the bid",
              "info", "Layering on the bid"].to_json()
    settings Hash["number-of-new-bids", 4,
                  "number-of-cancels", 4,
                  "length-of-monitoring-window", 5].to_json()
  end

    factory :ask_layering_monitor do
    type "AskLayeringMonitor"
    desc Hash["name", "Layering on the ask",
              "info", "Layering on the ask"].to_json()
    settings Hash["number-of-new-asks", 4,
                  "number-of-cancels", 4,
                  "length-of-monitoring-window", 5].to_json()
  end
end
