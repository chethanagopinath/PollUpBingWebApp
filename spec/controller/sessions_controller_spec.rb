require 'rails_helper'

describe SessionsController, type: :controller do
    describe 'it creates a new session' do
        before :each do
            @user1 = double('user1')
        end
        
        it 'creates a new session' do
            allow(@user1).to receive(:id)
            expect(User).to receive(:from_omniauth).and_return(@user1)
            get :create, provider:'Github'
      end
      it 'displays flash message' do
            allow(@user1).to receive(:id)
            allow(User).to receive(:from_omniauth).and_return(@user1)
            get :create, provider: 'facebook'
            expect(flash[:notice]).to eq("Successfully logged in")
        end
        it 'displays a flash message' do
            allow(@session).to receive(:[]).with(:user_id)
            get :destroy
            expect(flash[:notice]).to eq("Successfully logged out")
        end
   describe 'it destroys a session' do
        before :each do
            @user1 = double('user1')
            @session = double('session',:user_id => '3')
        end
        
        it 'destroys a session' do
            allow(@session).to receive(:[]).with(:user_id)
            get :destroy
            expect(@session[:user_id]).to eq(nil)
        end 
  end
  end
  end