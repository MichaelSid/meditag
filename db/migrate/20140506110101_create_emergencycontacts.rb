class CreateEmergencycontacts < ActiveRecord::Migration
  def change
    create_table :emergencycontacts do |t|
      t.string :belongs_to

      t.timestamps
    end
  end
end
