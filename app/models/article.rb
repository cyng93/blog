class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: {minimum: 5}

  mount_uploaders :attachments, AttachmentUploader

  # sqlite3 didn't have json type so we need a workaround
  #   for details, check: https://goo.gl/pSozVj
  serialize :attachments, Array
end
