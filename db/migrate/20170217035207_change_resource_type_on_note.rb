class ChangeResourceTypeOnNote < ActiveRecord::Migration[5.0]
  def change
    change_column :notes, :resource_type, :string
  end
end
