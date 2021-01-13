class Poll < ActiveRecord::Base
    has_many :vote_options, dependent: :destroy
    validates :topic, presence: true
end
