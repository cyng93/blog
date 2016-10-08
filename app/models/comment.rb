class Comment < ApplicationRecord
  belongs_to :article
  validate :have_either_text_or_attachment

  mount_uploader :attachment, AttachmentUploader
end

def have_either_text_or_attachment
  if body.blank? && attachment.blank?
    errors.add :base, 'Comment need to have at least text or file!'
    # Line below are used to pass error message to comment's parent,
    #   and to reproduce mutliple rendering issues in controller
    self.article.errors.add :base, 'Comments contains nothing!'
  end
end
