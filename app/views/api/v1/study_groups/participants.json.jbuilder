json.participants @participants.each do |participant|
  json.id participant[0]
  json.student_id participant[5]
  json.name participant[1]
  json.category participant[2]
  json.photo participant[3]
  json.email participant[4]
end