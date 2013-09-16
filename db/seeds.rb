# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lust     = Sin.create!(name: "lust", explanation: 'some explanation')
gluttony = Sin.create!(name: "gluttony", explanation: 'some explanation')
greed    = Sin.create!(name: "greed", explanation: 'some explanation')
wrath    = Sin.create!(name: "wrath", explanation: 'some explanation')
envy     = Sin.create!(name: "envy", explanation: 'some explanation')
pride    = Sin.create!(name: "pride", explanation: 'some explanation')
sloth    = Sin.create!(name: "sloth", explanation: 'some explanation')
other    = Sin.create!(name: "other", explanation: 'some explanation')
SinProject.create!(sin_id: pride.id, name: "Syrien: Helft den Kindern!", description: "Der Bürgerkrieg in Syrien eskaliert, und die Kinder trifft es am härtesten. ", betterplace_id: 10773)
SinProject.create!(sin_id: pride.id, name: "600 glückliche Hundeaugen", description: "Hilfe für notleidende Hunde und Katzen in Villena.", betterplace_id: 12059)
