class ProjectParticipant < ApplicationRecord
    #associations
    belongs_to :student
    belongs_to :project

    #validations
    validates :student, :project, :start_year, presence: true
    
    mount_uploader :file_to_upload, FileUploader
end
