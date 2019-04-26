class Studant < ApplicationRecord
  acts_as_paranoid

  #Associations
  has_many :participants, dependent: :destroy
  has_many :study_groups, through: :participants
  has_one :attachment
  belongs_to :project

  #Validations
  validates :name, :category, presence: true

  accepts_nested_attributes_for :project
  
  #types
  enum category:[:scientific_research,:masters_degree,:doctorate_degree,:post_doctoral]

end
