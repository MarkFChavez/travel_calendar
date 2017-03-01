class RemoveDescriptionOnEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :description
  end
end
