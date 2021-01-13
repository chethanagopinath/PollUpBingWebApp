# spec/factories/polls.rb
FactoryGirl.define do
  factory :poll do |f|
    f.topic     { Faker::String.random }
  end
end