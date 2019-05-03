json.students @students.each do |student|
    json.id student.id
    json.name student.name
    json.category student.category
    json.email student.email
    json.photo student.photo
end