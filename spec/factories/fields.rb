FactoryGirl.define do
  factory :field, class: Field do
    name Faker::Lorem.words(1)
    field_type Faker::Lorem.words(1)
    description Faker::Lorem.sentence(3)
    active true
  end

  trait :of_a_user do
    association :user, factory: :user, strategy: :build
  end
end
