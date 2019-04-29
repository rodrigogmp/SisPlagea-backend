class ProjectParticipant < ApplicationRecord
    #associations
    belongs_to :studant
    belongs_to :project

    #validations
    validates :studant, :project, :start_year, presence: true
    
    mount_uploader :file_to_upload, FileUploader
end
