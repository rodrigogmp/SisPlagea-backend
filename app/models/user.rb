class User < ApplicationRecord
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  mount_uploader :photo, ImageUploader
  
end
