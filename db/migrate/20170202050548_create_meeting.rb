class CreateMeeting < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.column :start_time, :datetime
      t.column :end_time, :datetime

      t.timestamps
    end
  end
end
