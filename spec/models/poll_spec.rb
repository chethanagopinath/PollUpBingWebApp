# spec/models/poll_spec.rb
require 'rails_helper'

describe Poll do
  it "has a valid factory" do
    poll = FactoryGirl.build(:poll)
    expect(poll).to be_valid
  end
  
  describe 'validations' do
    it { should validate_presence_of(:topic) }
  end
  
  describe 'associations' do
    it { should accept_nested_attributes_for(:vote_options) }
    it { should have_many(:vote_options) }
  end
end