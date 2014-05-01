class CreateGpdetails < ActiveRecord::Migration
  def change
    create_table :gpdetails do |t|

      t.timestamps
    end
  end
end
