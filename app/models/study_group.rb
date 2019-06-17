class StudyGroup < ApplicationRecord
    has_many :group_participants, dependent: :destroy
    has_many :students, :through => :group_participants

    validates :name, :create_year, :leaders, :predominant_area, :objective, presence: true

end
