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
gluttony = Sin.create!(name: "gluttony", display_name: "Gluttony", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-gluttony.png'))
greed    = Sin.create!(name: "greed",    display_name: "Greed", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-greed.png'))
wrath    = Sin.create!(name: "wrath",    display_name: "Wrath", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-wrath.png'))
envy     = Sin.create!(name: "envy",     display_name: "Envy", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-envy.png'))
pride    = Sin.create!(name: "pride",    display_name: "Pride", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-pride.png'))
sloth    = Sin.create!(name: "sloth",    display_name: "Sloth", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-sloth.png'))
other    = Sin.create!(name: "other",    display_name: "Other", explanation: 'some explanation', icon: File.open(icon_dir + 'sin_icon-other.png'))

switch_locale :de do
  german_translations = [
    [lust, "Wollust", "Pornos geguckt, Fremdgegangen, Grabschen „schmutzige Gedanken“"],
    [gluttony, "Maßlosigkeit", "Zuviel geraucht, Bauch vollgeschlagen, Zuviel gesoffen"],
    [greed,    "Geiz",         "Alle Bonbons allein aufgegessen, Obdachlosem nichts gegeben, Kein Trinkgeld gegeben"],
    [wrath,    "Zorn",         "Beim Autofahren gepöbelt, Kind angeschrieen, Draufhauen"],
    [envy,     "Neid",         "Über Reiche lästern, Penisneid, Eifersucht"],
    [pride,    "Hochmut",      "Unnötig Klamotten geshoppt, herum geprahlt, zu teures Parfum gekauft"],
    [sloth,    "Trägheit",     "Oma nicht besucht, Blau gemacht, Nicht zurückgerufen"],
    [other,    "Eigene Sünde", "Beschreibe hier anonym Deine eigene Sünde. Aktualisiertes 
  Sündenregister folgt mit dem nächsten Update"]      
  ]

  german_translations.each do |t|
    sin = t.first
    sin.display_name = t[1]
    sin.explanation = t[2]
    sin.save!
  end
end


sp = SinProject.new(sin_id: pride.id, name: "Syrien: Helft den Kindern!", description: "Der Bürgerkrieg in Syrien eskaliert, und die Kinder trifft es am härtesten. ", betterplace_id: 10773)
sp.save!(validate: false) # no pictures therefore invalid
sp = SinProject.new(sin_id: pride.id, name: "600 glückliche Hundeaugen", description: "Hilfe für notleidende Hunde und Katzen in Villena.", betterplace_id: 12059)
sp.save!(validate: false) # no pictures therefore invalid
