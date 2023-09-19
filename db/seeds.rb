# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@admin',
  password: 'a4a4a4'
  )

25.times do |n|
  Customer.create!(
    last_name: "令和",
    first_name: "#{n + 1}太郎",
    kana_last_name: "レイワ",
    kana_first_name: "#{n + 1}タロウ",
    post_code: "1234567",
    address: "東京都渋谷区神南1-#{n + 1}",
    phone_number: "#{10.times.map { rand(9) }.join}",
    is_deleted: false,
    email: "test#{n + 1}@test.com",
    password: "password"
  )
end

Genre.create!(
  name: "ケーキ"
  )
