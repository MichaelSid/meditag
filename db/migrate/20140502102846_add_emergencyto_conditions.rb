class AddEmergencytoConditions < ActiveRecord::Migration
  def change
  	add_column :conditions, :emergency, :boolean
  end
end
