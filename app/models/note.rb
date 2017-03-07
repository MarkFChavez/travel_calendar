class Note < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :resource, polymorphic: true

  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

end
