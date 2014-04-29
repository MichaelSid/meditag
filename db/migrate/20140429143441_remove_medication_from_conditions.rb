class RemoveMedicationFromConditions < ActiveRecord::Migration
  def change
    remove_column :conditions, :medication, :string
  end
end
