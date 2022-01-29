# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create!(
              name: "ケーキ",

            )

Genre.create!(
              name: "プリン",

            )
Item.create!(
              genre_id: 1,
              image_id: nil,
              name: "チーズケーキ",
              explanation: "最高級生クリームを贅沢に使用。",
              price: 1000,
              is_active: true
              )
