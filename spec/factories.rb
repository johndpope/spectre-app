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
    user
  end

  factory :layering do
    type "Layering"
    content "Layering details"
    detection_time Time.now.utc.iso8601
  end
end
