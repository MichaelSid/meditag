class Condition < ActiveRecord::Base
	belongs_to :user
	validates :condition, presence: true
end
