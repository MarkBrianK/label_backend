# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# db/seeds.rb

require 'faker'

# Create 10 fake categories
10.times do
  Category.create!(name: Faker::Commerce.department(max: 1))
end

# Generate 50 fake cloths
50.times do
  # Generate fake data for each column
  name = Faker::Commerce.product_name
  image = "https://i5.walmartimages.com/asr/6fcc3213-1244-44b6-9de9-5ad8a72baff5.65bc122ce87645f005ec2eb44f9c6b0c.jpeg?odnHeight=450&odnWidth=450&odnBg=ffffff"
  description = Faker::Lorem.paragraph(sentence_count: 3)
  price = Faker::Commerce.price(range: 20..100, as_string: false)
  size = Faker::Number.between(from: 0, to: 4).to_s
  category = Category.order('RANDOM()').first

  # Create a new Cloth record with the fake data
  Cloth.create!(
    name: name,
    image: image,
    description: description,
    price: price,
    size: size,
    category: category
  )
end

