class StudyGroup < ApplicationRecord
    has_many :group_participants, dependent: :destroy
    has_many :students, :through => :group_participants

    validates :name, :create_year, :leaders, :predominant_area, :objective, presence: true



    def student_already_subscribed?(student)
        self.group_participants.where(student_id: student.id).any?
    end

    def link_participant(params)
        GroupParticipant.create!(student_id: params[:student_id], study_group_id: self.id)
    end
end
