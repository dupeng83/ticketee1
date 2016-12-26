class Attachment < ApplicationRecord
  belongs_to :ticket, optional: true

  mount_uploader :file, AttachmentUploader
end
