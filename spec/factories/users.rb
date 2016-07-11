FactoryGirl.define do
  factory :user, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    # password: BCrypt::Password.create('123123')
    password '123123'
    password_confirmation '123123'
    

    # trait :with_fields do
    #   association :field, factory: :field, strategy: :build
    # end
  end
end
