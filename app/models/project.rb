class Project < ApplicationRecord
    #acts_as_paranoid
    has_many :project_participants, dependent: :destroy
    has_many :projects, through: :project_participants

    validates :name, :abstract, :start_year, presence: true
end
