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

  factory :action do
    desc "Case opened"
    user
  end
end
