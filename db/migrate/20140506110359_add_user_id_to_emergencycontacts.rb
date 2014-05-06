class AddUserIdToEmergencycontacts < ActiveRecord::Migration
  def change
    add_reference :emergencycontacts, :user, index: true
  end
end
