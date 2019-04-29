class Attachment < ApplicationRecord
    belongs_to :subject
    # belongs_to :publication

    validates :file_to_upload, :subject, presence: true
    validate :check_id, on:[:create]
    
    #Uploader
    mount_uploader :file_to_upload, FileUploader

end
