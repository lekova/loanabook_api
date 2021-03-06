class Loan < ActiveRecord::Base
  belongs_to :loaner, class_name: "User"
  belongs_to :borrower, class_name: "User"
  belongs_to :book

  validates :book_id, presence: true
  validates :loaner, presence: true
  validates :borrower, presence: true
end
