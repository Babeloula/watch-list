# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating 100 movies from TMDB...'

tmdb = RestClient.get "https://api.themoviedb.org/3/movie/top_rated?api_key=eb0a13fea458d222eb5dcdd2e4d50618&language=fr-FR&page=1"
movies = JSON.parse(tmdb)["results"].first(100)

movies.each do |movie|
  movie = Movie.new(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
  movie.save!
end

puts 'Finished!'
