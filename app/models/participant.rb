class Participant < ApplicationRecord
  belongs_to :studant
  belongs_to :study_group

  validates :studant, :study_group, presence: true
end
