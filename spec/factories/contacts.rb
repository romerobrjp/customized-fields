FactoryGirl.define do
  factory :contact, class: Contact do
    name Faker::Name.name
    email Faker::Internet.email

    trait :of_a_user do
      association :user, factory: :user, strategy: :build
    end
  end
end
