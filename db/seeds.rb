# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "池内　文徳",
             email: "fumi7127@icloud.com",
             password:  "fumi7127",
             password_confirmation: "fumi7127",
             admin: true)