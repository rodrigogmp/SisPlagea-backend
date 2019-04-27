class Attachment < ApplicationRecord
    belongs_to :subject
    belongs_to :publication

    validates :file_to_upload, presence: true
    validate :check_id, on:[:create]
    
    #Uploader
    mount_uploader :file_to_upload, ImageUploader

    def check_if
        if self.subject_id.present? || self.publication_id.present?
            return true
        end
    end
end
