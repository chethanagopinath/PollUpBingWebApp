class User < ActiveRecord::Base
    has_many :authorizations
    validates :username, :email, :presence => true
    has_many :votes, dependent: :destroy
    has_many :vote_options, through: :votes
 
 def self.create_with_omniauth info
     create!(username: info['name'],email: info['email'])
 end      
 
 def self.exists? info
    !!(User.find_with_omniauth(info))
 end     
 
 def self.find_with_omniauth info
     User.find_by(username: info['name'],email: info['email'])
 end
 
 def add_provider auth_hash
    self.authorizations.create_with_omniauth auth
 end
 
 def voted_for?(poll)
    votes.any? {|v| v.vote_option.poll == poll}
 end
end
