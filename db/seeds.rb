# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating 10 pokemons...'
ids = (1..10).to_a

ids.each do |id|
  puts id
  api = RestClient.get "https://pokeapi.co/api/v2/pokemon/#{id}/"
  poke = JSON.parse(api)
  if poke["types"].count == 1
    pokemon = Pokemon.new(
      name: poke["name"],
      type_one: poke["types"][0]["type"]["name"],
      type_two: "N/A"
    )
  else
    pokemon = Pokemon.new(
      name: poke["name"],
      type_one: poke["types"][0]["type"]["name"],
      type_two: poke["types"][1]["type"]["name"]
    )
  end
  pokemon.save!
end

puts 'Finished!'
