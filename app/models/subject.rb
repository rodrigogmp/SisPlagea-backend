class Subject < ApplicationRecord
    has_many :attachments

    enum category:[:graduate,:postgraduate]

end
