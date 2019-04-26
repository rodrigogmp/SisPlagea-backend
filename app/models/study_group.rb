class StudyGroup < ApplicationRecord
    has_many :participants, dependent: :destroy
    has_many :studants, :through => :participants
end
