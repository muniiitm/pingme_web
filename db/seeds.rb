# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


location_read = Rails.root.join("config", "location.yml")
locations = YAML.load_file(location_read)
locations.each do |key,value|
  Location.create!(value)
end
