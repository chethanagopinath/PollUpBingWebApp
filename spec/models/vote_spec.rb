# spec/models/user_spec.rb
require 'rails_helper'

describe Vote do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:vote_option) } 
  end
end