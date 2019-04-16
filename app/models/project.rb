class Project < ApplicationRecord
    acts_as_paranoid
    has_many :studants
end
