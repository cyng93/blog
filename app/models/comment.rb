class Comment < ApplicationRecord
  belongs_to :article
  validate :have_either_text_or_attachment

  mount_uploader :attachment, AttachmentUploader
end

def have_either_text_or_attachment
  if body.blank? && attachment.blank?
    # Line below need to be included to make validate above works
    errors.add :base, 'Neither text or attachments is found in comment!'
    # Line below are used to pass error message to comment's parent
    self.article.errors.add :base, 'Comments contains nothing!'
  end
end
