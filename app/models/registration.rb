class Registration < ActiveRecord::Base

  include ValidationHelper
  validates_format_of :email, with: email_address

end
