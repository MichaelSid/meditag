class AddUserIdToGpdetails < ActiveRecord::Migration
  def change
    add_reference :gpdetails, :user, index: true
  end
end
