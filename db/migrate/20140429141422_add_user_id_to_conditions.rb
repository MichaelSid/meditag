class AddUserIdToConditions < ActiveRecord::Migration
  def change
    add_reference :conditions, :user, index: true
  end
end
