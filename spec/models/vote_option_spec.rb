# spec/models/user_spec.rb
require 'rails_helper'

describe VoteOption do
  it "has a valid factory" do
    vote_option = FactoryGirl.build(:vote_option)
    expect(vote_option).to be_valid
  end
  
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
  
  describe 'associations' do
    it { should belong_to(:poll) }
    it { should have_many(:votes) } 
    it { should have_many(:users) }
  end
end