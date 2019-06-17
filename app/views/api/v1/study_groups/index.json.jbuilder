json.subjects @study_groups.each do |subject|
  json.id study_group.id
  json.name study_group.name
  json.create_year study_group.create_year
  json.leaders study_group.leaders
  json.predominant_area study_group.predominant_area
  json.objective study_group.objective
end