class Profile < ActiveRecord::Base

  include ProfileValidators

  belongs_to :user
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "first_aid.jpeg"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates_format_of :contactnr, with: UK_PHONE_NUMBER

end
