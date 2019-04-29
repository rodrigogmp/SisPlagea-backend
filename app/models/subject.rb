class Subject < ApplicationRecord
    has_many :attachments

    enum category:[:graduate,:postgraduate]


    # def upload(params_upload)
    #     Attachment.create!(subject_id: self.id, file_to_upload: params_upload[:file_to_upload])
    # end
end
