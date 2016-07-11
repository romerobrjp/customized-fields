FactoryGirl.define do
  factory :field_value, class: FieldValue do
    association :field, factory: :field, strategy: :build
    association :contact, factory: :contact, strategy: :build
    value Faker::Lorem.words(2)

    trait :with_associations do
      association :field, factory: :field, strategy: :build
      association :contact, factory: :contact, strategy: :build
    end
  end
end
