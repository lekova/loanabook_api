class User < ActiveRecord::Base
  has_secure_password
  before_create :set_token

  validates :email, uniqueness: true

  has_many :loaner_loans, class_name:  "Loan",
                          foreign_key: "loaner_id",
                          dependent:   :destroy

  has_many :loaned_books, through: :loaner_loans, source: :book
  has_many :borrowed_books, through: :borrower_loans, source: :book

  has_many :loaners, through: :loaner_loans, source: :borrower

  has_many :borrower_loans, class_name:  "Loan",
                            foreign_key: "borrower_id",
                            dependent:   :destroy

  has_many :borrowers, through: :borrower_loans, source: :loaner

  has_many :user_one_conversations, class_name:  "Conversation",
                          foreign_key: "user_one_id",
                          dependent: :destroy

  has_many :user_two_conversations, class_name: "Conversation",
                                   foreign_key: "user_two_id",
                                   dependent: :destroy

  has_many :messages, foreign_key: "sender_id"
  has_many :books, foreign_key: "owner_id"

  def self.login(email, password)
    user = find_by email: email
    user.login password if user
  end

  def login(password)
    # authenticate method is defined through has_secure_password
    authenticate(password) && set_token && save! && token
  end

  private

  def set_token
    self.token = SecureRandom.hex
  end
end
