class AddEmergencytoMedications < ActiveRecord::Migration
  def change
  	add_column :medications, :emergency, :boolean
  end
end
