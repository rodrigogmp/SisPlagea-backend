class Subject < ApplicationRecord
    has_many :attachments

    enum category:[:graduate,:postgraduate]
    validates :name, :category, :code, :workload, :class_location, :description, presence: true
end
