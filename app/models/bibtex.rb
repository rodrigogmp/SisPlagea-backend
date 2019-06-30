class Bibtex < ApplicationRecord
  validates :file, presence: true
  mount_uploader :file, FileUploader
end
