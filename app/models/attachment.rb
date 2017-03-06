class Attachment < ApplicationRecord
  mount_uploader :file, AttachmentUploader

  belongs_to :comment
  validates_presence_of :file

  before_save :set_name

  private

  def set_name
    self.name = file.file.original_filename
  end
end
