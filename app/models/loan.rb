class Loan < ActiveRecord::Base
  belongs_to :loaner, class_name: "User"
  belongs_to :borrower, class_name: "User"

  validates :book, presence: true
  validates :loaner, presence: true
  validates :borrower, presence: true
end
