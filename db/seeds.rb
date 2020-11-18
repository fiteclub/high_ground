# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)jjj
data = YAML.safe_load(File.read('/Users/matt/repos/HighGround/db/celebrities.yml')).deep_symbolize_keys
data[:celebrities].each do |celebrity|
  location = Location.create(
    address_1: celebrity[:address_1],
    address_2: celebrity[:address_2],
    city: celebrity[:city],
    state: celebrity[:state],
    zip: celebrity[:zip]
  )
  Combatant.create(
    first_name: celebrity[:first_name],
    last_name: celebrity[:last_name],
    location: location
  )
end
