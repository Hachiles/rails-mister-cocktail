# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts "Cleaning database now..."
Ingredient.destroy_all
puts "Database clean ✅"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized = open(url).read
list = JSON.parse(serialized)

list_array = list["drinks"]
list_array.each do |ing|
  Ingredient.create(name: ing["strIngredient1"])
end

puts "Done! Created #{Ingredient.count} ingredients."
