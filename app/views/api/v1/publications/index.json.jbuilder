json.publications @publications.each do |publication|
  json.id publication.id
  json.title publication.title
  json.journal publication.journal
  json.category publication.category
  json.year publication.year
  json.volume publication.volume
  json.pages publication.pages
  json.authors publication.authors
  unless publication.file_to_upload.nil?
    json.file publication.file_to_upload
  end
end