class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.string :contactnr
      t.string :address1
      t.string :address2
      t.string :town
      t.string :county
      t.string :country
      t.string :postcode
      t.string :gender

      t.timestamps
    end
  end
end
