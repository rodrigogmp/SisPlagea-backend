class Project < ApplicationRecord
    acts_as_paranoid
    has_many :studants

    validates :name, :abstract, :start_year, presence: true
end
