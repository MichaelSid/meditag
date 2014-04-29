class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :condition
      t.text :medication
      t.text :notes

      t.timestamps
    end
  end
end
