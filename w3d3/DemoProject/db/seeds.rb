# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# House.drop_all
house1 = House.create!(address: "East Troy")
house2 = House.create!(address: "Bangladesh")
house3 = House.create!(address: "Bangkok")


# Person.drop_all
nate = Person.create!(name: "Nate", house_id: 1)
bobby = Person.create!(name: "Bobby", house_id: 2)
alex = Person.create!(name: "Alexander", house_id: 2)
tony = Person.create!(name: "Tony", house_id: 1)
jordan = Person.create!(name: "Jordan", house_id: 1)
