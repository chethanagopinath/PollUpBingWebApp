# spec/models/user_spec.rb
require 'rails_helper'

describe User do
  it "has a valid factory" do
    #FactoryGirl.create(:user).should be_valid
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end
  
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
  end
  
  describe 'associations' do
    it { should have_many(:authorizations) }
    it { should have_many(:votes) } 
    it { should have_many(:vote_options) }
  end
end