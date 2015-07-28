class User < ActiveRecord::Base
  has_secure_password
  before_create :set_token

  validates :email, uniqueness: true

  has_many :loaner_loans, class_name:  "Loan",
                          foreign_key: "loaner_id",
                          dependent:   :destroy

  has_many :borrower_loans, class_name:  "Loan",
                            foreign_key: "borrower_id",
                            dependent:   :destroy

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
