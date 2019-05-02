class Project < ApplicationRecord
    #acts_as_paranoid
    has_many :project_participants, dependent: :destroy
    has_many :projects, through: :project_participants

    validates :name, :abstract, presence: true


    def student_already_subscribed?(student)
        self.project_participants.where(student_id: student.id).any?
    end

    def link_participant(params)
        ProjectParticipant.create!(student_id: params[:student_id], project_id: self.id, start_year: params[:start_year], end_year: params[:end_year], file_to_upload: params[:file_to_upload])
    end
end
