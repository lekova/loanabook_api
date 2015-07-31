class Book < ActiveRecord::Base
  belongs_to :user
  belongs_to :loan

  validates :owner_id, presence: true
end
