class Publication < ApplicationRecord

    #Associations
    has_one :attachment, dependent: :destroy
end
