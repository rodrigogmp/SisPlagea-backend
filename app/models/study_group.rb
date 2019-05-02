class StudyGroup < ApplicationRecord
    has_many :group_participants, dependent: :destroy
    has_many :students, :through => :group_participants
end
