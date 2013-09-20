# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

flame1   = Flame.create!(amount_in_cents:  5_00)
flame2   = Flame.create!(amount_in_cents: 15_00)
flame3   = Flame.create!(amount_in_cents: 25_00)
flame4   = Flame.create!(amount_in_cents: 50_00)

def switch_locale(locale)
  old = I18n.locale
  I18n.locale = :de
  yield
ensure
  I18n.locale = old
end


icon_dir = Rails.root + 'public/images/icons/sins'
lust     = Sin.create!(name: "lust", display_name: 'Lust', explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-lust.png'))
switch_locale :de do
  lust.display_name = 'Wollust'
  lust.explanation = 'irgendeine Erklärung'
  lust.save!
end
gluttony = Sin.create!(name: "gluttony", display_name: "Gluttony", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-gluttony.png'))
greed    = Sin.create!(name: "greed",    display_name: "Greed", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-greed.png'))
wrath    = Sin.create!(name: "wrath",    display_name: "Wrath", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-wrath.png'))
envy     = Sin.create!(name: "envy",     display_name: "Envy", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-envy.png'))
pride    = Sin.create!(name: "pride",    display_name: "Pride", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-pride.png'))
sloth    = Sin.create!(name: "sloth",    display_name: "Sloth", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-sloth.png'))
other    = Sin.create!(name: "other",    display_name: "Other", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-other.png'))

sp = SinProject.new(sin_id: pride.id, name: "Syrien: Helft den Kindern!", description: "Der Bürgerkrieg in Syrien eskaliert, und die Kinder trifft es am härtesten. ", betterplace_id: 10773)
sp.save!(validate: false) # no pictures therefore invalid
sp = SinProject.new(sin_id: pride.id, name: "600 glückliche Hundeaugen", description: "Hilfe für notleidende Hunde und Katzen in Villena.", betterplace_id: 12059)
sp.save!(validate: false) # no pictures therefore invalid
