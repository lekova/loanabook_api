class Loan < ActiveRecord::Base
  belongs_to :loaner, class_name: "User"
  belongs_to :borrower, class_name: "User"

  validates :book_id, presence: true
  validates :loaner_id, presence: true
  validates :borrower_id, presence: true
end
