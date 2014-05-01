class Medication < ActiveRecord::Base
  belongs_to :user
  validates :medication, presence: true
end
