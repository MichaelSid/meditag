class AddUserIdToMedications < ActiveRecord::Migration
  def change
    add_reference :medications, :user, index: true
  end
end
