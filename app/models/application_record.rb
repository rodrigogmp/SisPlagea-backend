class ApplicationRecord < ActiveRecord::Base
  extend Devise::Models
  self.abstract_class = true
end
