# spec/factories/vote_options.rb
FactoryGirl.define do
  factory :vote_option do |f|
    f.title     { Faker::String.random }
  end
end