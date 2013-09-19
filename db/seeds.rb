# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

flame1   = Flame.create!(amount_in_cents:  500)
flame2   = Flame.create!(amount_in_cents: 1_500)
flame3   = Flame.create!(amount_in_cents: 2_500)

lust     = Sin.create!(name: "lust", explanation: 'some explanation', icon: 'sin_icon-lust.png')
gluttony = Sin.create!(name: "gluttony", explanation: 'some explanation', icon: 'sin_icon-gluttony.png')
greed    = Sin.create!(name: "greed", explanation: 'some explanation', icon: 'sin_icon-greed.png')
wrath    = Sin.create!(name: "wrath", explanation: 'some explanation', icon: 'sin_icon-wrath.png')
envy     = Sin.create!(name: "envy", explanation: 'some explanation', icon: 'sin_icon-envy.png')
pride    = Sin.create!(name: "pride", explanation: 'some explanation', icon: 'sin_icon-pride.png')
sloth    = Sin.create!(name: "sloth", explanation: 'some explanation', icon: 'sin_icon-sloth.png')
other    = Sin.create!(name: "other", explanation: 'some explanation', icon: 'sin_icon-other.png')

sp = SinProject.new(sin_id: pride.id, name: "Syrien: Helft den Kindern!", description: "Der Bürgerkrieg in Syrien eskaliert, und die Kinder trifft es am härtesten. ", betterplace_id: 10773)
sp.save(false) # no pictures therefore invalid
sp = SinProject.new(sin_id: pride.id, name: "600 glückliche Hundeaugen", description: "Hilfe für notleidende Hunde und Katzen in Villena.", betterplace_id: 12059)
sp.save(false) # no pictures therefore invalid
