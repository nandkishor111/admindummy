class Project < ApplicationRecord
  belongs_to :client
  has_many :images
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
end
