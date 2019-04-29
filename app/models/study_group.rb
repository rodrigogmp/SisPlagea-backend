class StudyGroup < ApplicationRecord
    has_many :group_participants, dependent: :destroy
    has_many :studants, :through => :group_participants
end
