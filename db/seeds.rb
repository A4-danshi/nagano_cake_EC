# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ＝＝＝＝＝＝＝＝＝＝＝Admin情報の追加＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

Admin.create!(
  email: 'admin@admin',
  password: 'a4a4a4'
  )

# ＝＝＝＝＝＝＝＝＝＝＝初期Customerの追加＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

12.times do |n|
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

# ＝＝＝＝＝＝＝＝＝＝＝初期Genreの追加＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

  ['ケーキ', '焼き菓子', 'プリン', 'キャンディ', 'その他']
  .each do |name|
    Genre.create!(
      { name: name }
    )
  end

# ＝＝＝＝＝＝＝＝＝＝＝初期Itemの追加＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

item1 = Item.new(
  name: "チーズケーキ",
  introduction: "大人から子供までみんなに愛される安心のお味。",
  genre_id: 1,
  price: 2000,
  is_sale: true
)
item1.item_image.attach(io: File.open(Rails.root.join('app/assets/images/cheese_cake.jpg')), filename: 'cheese_cake.jpg')
item1.save!

item2 = Item.new(
  name: "麻婆豆腐",
  introduction: "ケーキ屋なのに麻婆豆腐！？あまりの旨さと辛さに、あなたはきっと衝撃を受ける！！",
  genre_id: 5,
  price: 1500,
  is_sale: false
)
item2.item_image.attach(io: File.open(Rails.root.join('app/assets/images/mabo_tohu.jpg')), filename: 'mabo_tohu.jpg')
item2.save!

item3 = Item.new(
  name: "新鮮卵のこんがり焼きプリン",
  introduction: "焼き菓子なのかプリンなのか、もはやジャンルが不明！しかも市販品！！",
  genre_id: 3,
  price: 150,
  is_sale: true
)
item3.item_image.attach(io: File.open(Rails.root.join('app/assets/images/pudding.jpg')), filename: 'pudding.jpg')
item3.save!

item4 = Item.new(
  name: "チョコケーキ",
  introduction: "自家製チョコを使用した大人気商品。すぐに品切れになってしまいますので、ご予約はお早めに！",
  genre_id: 1,
  price: 2500,
  is_sale: true
)
item4.item_image.attach(io: File.open(Rails.root.join('app/assets/images/choco_cake.jpg')), filename: 'choko_cake.jpg')
item4.save!

item5 = Item.new(
  name: "モンブラン",
  introduction: "秋限定の大人気商品！",
  genre_id: 1,
  price: 600,
  is_sale: false
)
item5.save!

item3 = Item.new(
  name: "キャンディアソート",
  introduction: "とっても甘くて見た目もかわいいキャンディの詰め合わせ。プレゼントにも最適♪",
  genre_id: 4,
  price: 800,
  is_sale: true
)
item3.item_image.attach(io: File.open(Rails.root.join('app/assets/images/candy.jpg')), filename: 'candy.jpg')
item3.save!

item6 = Item.new(
  name: "フィナンシェ",
  introduction: "これぞ、焼き菓子の王様！焼きたてをぜひご賞味ください！！♪",
  genre_id: 2,
  price: 250,
  is_sale: true
)
item6.item_image.attach(io: File.open(Rails.root.join('app/assets/images/financier.jpg')), filename: 'financier.jpg')
item6.save!

item7 = Item.new(
  name: "ジンジャークッキー",
  introduction: "かわいらしい見た目のジンジャークッキー♡お子様へのプレゼントにいかがですか？",
  genre_id: 2,
  price: 500,
  is_sale: true
)
item7.item_image.attach(io: File.open(Rails.root.join('app/assets/images/ginger_cookie.jpg')), filename: 'ginger_cookie.jpg')
item7.save!
