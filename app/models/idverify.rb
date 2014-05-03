class Idverify < ActiveRecord::Base
  validates :'tag-uuid', presence: true
  validates :'uuid-form', presence: true
end
