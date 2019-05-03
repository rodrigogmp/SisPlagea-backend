json.participants @participants.each do |participant|
    json.project_participant_id participant.id
    json.student_id participant.student_id
    json.project_id participant.project_id
    json.start_year participant.start_year
    json.end_year participant.end_year
end