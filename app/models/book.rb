class Book < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :loan

  validates :owner, presence: true

  enum status: { available: 0, unavailable: 1, deleted: 3 }
  # http://www.sitepoint.com/enumerated-types-with-activerecord-and-postgresql/
end
