class AddFirstnameToGpdetails < ActiveRecord::Migration
  def change
    add_column :gpdetails, :firstname, :string
  end
end
