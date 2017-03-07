class AddAttachmentToNote < ActiveRecord::Migration[5.0]
  def change
    add_attachment :notes, :attachment
  end
end
