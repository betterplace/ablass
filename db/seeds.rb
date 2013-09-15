# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lust     = Sin.create!(name: "lust")
gluttony = Sin.create!(name: "gluttony")
greed    = Sin.create!(name: "greed")
wrath    = Sin.create!(name: "wrath")
envy     = Sin.create!(name: "envy")
pride    = Sin.create!(name: "pride")
sloth    = Sin.create!(name: "sloth")
other    = Sin.create!(name: "other")
SinProject.create!(sin_id: pride.id, name: "Syrien: Helft den Kindern!", description: "Der Bürgerkrieg in Syrien eskaliert, und die Kinder trifft es am härtesten. ", betterplace_id: 10773)
SinProject.create!(sin_id: pride.id, name: "600 glückliche Hundeaugen", description: "Hilfe für notleidende Hunde und Katzen in Villena.", betterplace_id: 12059)
