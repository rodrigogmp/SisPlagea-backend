class GroupParticipant < ApplicationRecord
  belongs_to :student
  belongs_to :study_group

  validates :student, :study_group, presence: true
end
