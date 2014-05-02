class CreateIdverifies < ActiveRecord::Migration
  def change
    create_table :idverifies do |t|

      t.timestamps
    end
  end
end
