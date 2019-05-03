json.projects @projects.each do |project|
    json.id project.id
    json.name project.name
    json.abstract project.abstract
end
