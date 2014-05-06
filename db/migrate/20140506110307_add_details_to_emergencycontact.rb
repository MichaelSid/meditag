class AddDetailsToEmergencycontact < ActiveRecord::Migration
  def change
    add_column :emergencycontacts, :firstname, :string
    add_column :emergencycontacts, :lastname, :string
    add_column :emergencycontacts, :relationship, :string
    add_column :emergencycontacts, :contactnr, :string
    add_column :emergencycontacts, :address1, :string
    add_column :emergencycontacts, :address2, :string
    add_column :emergencycontacts, :town, :string
    add_column :emergencycontacts, :county, :string
    add_column :emergencycontacts, :country, :string
    add_column :emergencycontacts, :postcode, :string
  end
end

