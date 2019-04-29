class Studant < ApplicationRecord
  acts_as_paranoid

  #Associations
  has_many :project_participants, dependent: :destroy
  has_many :projects, through: :project_participants

  has_many :group_participants, dependent: :destroy
  has_many :study_groups, through: :group_participants


  has_one :attachment
  

  #Validations
  validates :name, :category, presence: true

  # accepts_nested_attributes_for :project

  mount_uploader :photo, ImageUploader
  
  #types
  enum category:[:scientific_research,:masters_degree,:doctorate_degree,:post_doctoral]

end
