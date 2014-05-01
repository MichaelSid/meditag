 class AddDetailsToGpdetails < ActiveRecord::Migration
  def change
    add_column :gpdetails, :lastname, :string
    add_column :gpdetails, :faxnumber, :string
    add_column :gpdetails, :contactnr, :string
    add_column :gpdetails, :address1, :string
    add_column :gpdetails, :address2, :string
    add_column :gpdetails, :town, :string
    add_column :gpdetails, :county, :string
    add_column :gpdetails, :country, :string
    add_column :gpdetails, :postcode, :string
  end
end
