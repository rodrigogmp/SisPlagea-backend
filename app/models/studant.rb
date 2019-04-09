class Studant < ApplicationRecord
  #Associations
  belongs_to :project

  #Validations
  validates :name, :email

  enum category:[:scientific_research,:masters_degree,:doctorate_degree,:post_doctoral]

end
