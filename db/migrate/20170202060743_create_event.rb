class CreateEvent < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :start_time, :datetime
      t.column :end_time, :datetime

      t.timestamps
    end
  end
end
