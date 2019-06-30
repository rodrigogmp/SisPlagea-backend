class Publication < ApplicationRecord
    
    #Associations
    # has_one :attachment, dependent: :destroy
    validates :title,:category,:year,:authors, presence: true

    enum category:[:conference,:abstract,:periodic]

    mount_uploader :file_to_upload, FileUploader
end
