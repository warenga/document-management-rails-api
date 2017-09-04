# spec/factories/roles.rb

FactoryGirl.define do
  factory :role do
    title { Faker::Lorem.word }
  end
end
