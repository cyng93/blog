class Comment < ApplicationRecord
  belongs_to :article

  mount_uploader :attachment, AttachmentUploader
end
