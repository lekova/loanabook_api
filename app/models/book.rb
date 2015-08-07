class Book < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :loan

  validates :owner, presence: true

  enum status: { available: 0, unavailable: 1, deleted: 3 }
  # http://www.sitepoint.com/enumerated-types-with-activerecord-and-postgresql/

  has_attached_file :image,  #Or whatever you want to call the image you're uploading.
              :styles => { :medium => "300x300>", :thumb => "100x100>" },
              :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
