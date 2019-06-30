json.contacts @contacts.each do |contact|
  json.id contact.id
  json.subject contact.subject
  json.message contact.message
  json.file_to_upload contact.file_to_upload
end