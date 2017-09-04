# spec/factories/users.rb

FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Name.name }
    role_id nil
  end
end
