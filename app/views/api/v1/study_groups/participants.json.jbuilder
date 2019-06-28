json.participants @participants.each do |participant|
  json.id participant[0]
  json.student_id participant[1]
  json.name participant[2]
end