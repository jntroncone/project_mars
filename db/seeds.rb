# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

item1 = Product.create!(
    name: 'scalpel',
    description: 'it cuts or something'
)
item2 = Product.create!(
    name: 'stitches',
    description: 'sew em up'
)