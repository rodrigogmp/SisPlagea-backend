json.participants @participants.each do |participant|
    json.id participant.id
    json.student_id participant.student_id
    json.name participant.student.name
    json.start_year participant.start_year
    json.end_year participant.end_year
    json.file participant.file_to_upload
end