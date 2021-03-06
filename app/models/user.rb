class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :conditions
  has_many :medications
  has_one :gpdetail
  has_one :emergencycontact


  accepts_nested_attributes_for :medications, reject_if: lambda { |c| c[:medication].blank? }, allow_destroy: true
  accepts_nested_attributes_for :conditions, reject_if: lambda { |c| c[:condition].blank? }, allow_destroy: true
  
end
