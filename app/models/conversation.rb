class Conversation < ActiveRecord::Base
  validates :user_one, presence: true
  validates :user_two, presence: true
end
