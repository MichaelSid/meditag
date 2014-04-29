class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :medication
      t.text :dose

      t.timestamps
    end
  end
end
