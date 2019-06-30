class Attachment < ApplicationRecord
    belongs_to :subject
    # belongs_to :publication

    validates :file_to_upload, :name, :subject, presence: true
    
    #Uploader
    mount_uploader :file_to_upload, FileUploader

end
