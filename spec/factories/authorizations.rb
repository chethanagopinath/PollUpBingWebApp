# spec/factories/authorizations.rb
FactoryGirl.define do
  factory :authorization do |f|
    f.uid     { Faker::Number.number(digits: 10) }
    f.provider         { Faker::String.random }
  end
end