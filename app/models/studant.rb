class Studant < ApplicationRecord
  #Associations
  belongs_to :project, optional: true

  #Validations
  validates :name, presence: true

  enum category:[:scientific_research,:masters_degree,:doctorate_degree,:post_doctoral]

end
