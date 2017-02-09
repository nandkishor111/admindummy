class Image < ApplicationRecord
  belongs_to :project
  mount_uploader :attachimg, AttachmentUploader
end
