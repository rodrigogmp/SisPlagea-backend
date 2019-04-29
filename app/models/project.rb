class Project < ApplicationRecord
    #acts_as_paranoid
    has_many :project_participants, dependent: :destroy
    has_many :projects, through: :project_participants

    validates :name, :abstract, presence: true


    def studant_already_subscribed?(studant)
        byebug
        self.project_participants.where(studant_id: studant.id).any?
    end

    def link_participant(params)
        byebug
        ProjectParticipant.create!(studant_id: params[:studant_id], project_id: self.id, start_year: params[:start_year], end_year: params[:end_year])
    end
end
