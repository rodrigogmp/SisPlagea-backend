json.subjects @subjects.each do |subject|
    json.id subject.id
    json.name subject.name
    json.category subject.category
end