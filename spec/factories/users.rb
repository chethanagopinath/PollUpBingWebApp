# spec/factories/users.rb
FactoryGirl.define do
  factory :user do |f|
    f.username     { Faker::Name.name }
    f.email         { Faker::Internet.email }
    f.firstname nil
    f.lastname nil
    f.bio nil
    f.interests nil
  end
end