json.attachments @attachments.each do |attachment|
    json.id attachment.id
    json.subject_id attachment.subject_id
    json.name attachment.name
    json.file_to_upload attachment.file_to_upload
end