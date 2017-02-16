class CreateNote < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.column :resource_id, :integer
      t.column :resource_type, :integer
      t.column :content, :text

      t.timestamps
    end

    add_index :notes, [:resource_id, :resource_type]
  end
end
