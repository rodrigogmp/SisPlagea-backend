# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    User.create!(email:"rmarafelli@gmail.com", password:123456)
    Project.create!(name:"Primeiro Projeto", abstract: "aaaaaaa")
    Student.create!(name:"rodrigo", email:"rodrigogmp@estudente.ufla.br", category: "scientific_research")
    Subject.create!(name:"Algoritmos em Grafos", category: "graduate")
