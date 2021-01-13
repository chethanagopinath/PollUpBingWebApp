# spec/models/authorization_spec.rb
require 'rails_helper'

describe Authorization do
  it "has a valid factory" do
    auth = FactoryGirl.build(:authorization)
    expect(auth).to be_valid
  end
  
  describe 'validations' do
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:provider) }
  end
  
  describe 'associations' do
    #it { should validate_uniqueness_of(:uid) }
    it { should belong_to(:user) }
  end
end