json.materials @subject.attachments.each do |material|
    json.id material.id
    json.name material.name
    json.file_to_upload material.file_to_upload
end