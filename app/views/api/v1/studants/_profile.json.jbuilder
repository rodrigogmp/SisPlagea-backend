json.id @studant.id
json.name @studant.name
json.category @studant.category
json.photo @studant.photo

unless @studant.project.nil?
    json.project do
        json.id @studant.project.id
        json.abstract @studant.project.abstract
        json.start_year @studant.project.start_year
        json.end_year @studant.project.end_year
    end
end