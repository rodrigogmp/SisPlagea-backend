class Contact < ApplicationRecord
  validates :email, :subject, :message, presence: true

  mount_uploader :file_to_upload, FileUploader
end
