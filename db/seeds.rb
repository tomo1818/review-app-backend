# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ユーザー作成
user1 = User.create!(name: 'User1', email: 'test1@email.com', password: 'password', password_confirmation: 'password')
user2 = User.create!(name: 'User2', email: 'test2@email.com', password: 'password', password_confirmation: 'password')
user3 = User.create!(name: 'User3', email: 'test3@email.com', password: 'password', password_confirmation: 'password')

# グループ作成
group1 = Group.create!({name:"GROUP1", owner_id: user1.id})
group2 = Group.create!({name:"GROUP2", owner_id: user1.id})
group3 = Group.create!({name:"GROUP3", owner_id: user2.id})

# ユーザーとグループの関連付けを追加
user1.groups << group1
user1.groups << group2
user1.save

user2.groups << group2
user2.groups << group3
user2.save

user3.groups << group3
user3.groups << group2
user3.groups << group1
user3.save

# カテゴリーを作成
category1 = Category.create!(name: 'Category1', group: group1)
category2 = Category.create!(name: 'Category2', group: group2)
category3 = Category.create!(name: 'Category3', group: group1)
category4 = Category.create!(name: 'Category4', group: group1)

# Shopを作成
shop1 = Shop.create!(name: 'Shop1', group: group1, category: category1, avg_score: 5, done: false, visit_day: 'Sat, 03 Sep 2022', tag_string: 'tag1,tag2,tag3', description: 'ディスクリプションディスクリプションディスクリプションディスクリプションディスクリプションディスクリプション', url: '')
shop2 = Shop.create!(name: 'Shop2', group: group1, category: category1, avg_score: 5, done: false, visit_day: 'Sat, 03 Sep 2022', tag_string: 'tag1,tag2', description: 'ディスクリプションディスクリプションディスクリプションディスクリプションディスクリプションディスクリプション', url: '')
shop3 = Shop.create!(name: 'Shop3', group: group2, category: category2, avg_score: 5, done: false, visit_day: 'Sat, 03 Sep 2022', tag_string: 'tag3,tag4', description: 'ディスクリプションディスクリプションディスクリプションディスクリプションディスクリプションディスクリプション', url: '')
shop4 = Shop.create!(name: 'Shop4', group: group2, category: category2, avg_score: 5, done: false, visit_day: 'Sat, 03 Sep 2022', tag_string: 'tag1', description: 'ディスクリプションディスクリプションディスクリプションディスクリプションディスクリプションディスクリプション', url: '')
shop5 = Shop.create!(name: 'Shop5', group: group1, category: category3, avg_score: 5, done: false, visit_day: 'Sat, 03 Sep 2022', tag_string: 'tag1', description: 'ディスクリプションディスクリプションディスクリプションディスクリプションディスクリプションディスクリプション', url: '')
shop6 = Shop.create!(name: 'Shop6', group: group1, category: category4, avg_score: 5, done: false, visit_day: 'Sat, 03 Sep 2022', tag_string: 'tag1', description: 'ディスクリプションディスクリプションディスクリプションディスクリプションディスクリプションディスクリプション', url: '')
shop7 = Shop.create!(name: 'Shop7', group: group1, category: category1, avg_score: 5, done: false, visit_day: 'Sat, 03 Sep 2022', tag_string: 'tag1', description: 'ディスクリプションディスクリプションディスクリプションディスクリプションディスクリプションディスクリプション', url: '')

# Photoを作成
photo1 = Photo.create!(image: File.open("./public/images/dummy1.jpg"), shop: shop1)
photo2 = Photo.create!(image: File.open("./public/images/dummy2.jpg"), shop: shop1)
photo3 = Photo.create!(image: File.open("./public/images/dummy3.jpg"), shop: shop1)

# タグを作成
tag1 = Tag.create!(name: 'tag1', group: group1)
tag2 = Tag.create!(name: 'tag2', group: group1)
tag3 = Tag.create!(name: 'tag3', group: group1)
tag5 = Tag.create!(name: 'tag5', group: group2)
tag6 = Tag.create!(name: 'tag6', group: group2)
tag7 = Tag.create!(name: 'tag7', group: group2)

# ショップとタグの関連付けを追加
shop1.tags << tag1
shop1.tags << tag2
shop1.tags << tag3
shop2.tags << tag1
shop2.tags << tag2
shop3.tags << tag5
shop3.tags << tag6
shop4.tags << tag7
shop5.tags << tag1
shop6.tags << tag2
shop7.tags << tag3

# Reviewを作成
review1 = Review.create!(shop: shop1, user: user1, author: user1.name, comment: 'コメントのテスト1', score: 5, title: 'タイトルのテスト1')
review2 = Review.create!(shop: shop2, user: user1, author: user1.name, comment: 'コメントのテスト2', score: 5, title: 'タイトルのテスト2')
review3 = Review.create!(shop: shop1, user: user2, author: user2.name, comment: 'コメントのテスト3', score: 3, title: 'タイトルのテスト3')
review4 = Review.create!(shop: shop3, user: user3, author: user3.name, comment: 'コメントのテスト4', score: 5, title: 'タイトルのテスト4')

# ショップ作成テスト
# curl -X POST http://localhost:3000/api/v1/shops -d "shop[name]=test&shop[group_id]=1&shop[category_id]=1&shop[avg_score]=0&shop[done]=false&shop[visit_day]=2022_sat&shop[tag_string]=tag1,tag2,tag5"

# カテゴリ作成テスト
# curl -X POST http://localhost:3000/api/v1/categories -d "category[name]=test&category[group_id]=1&category[thumbnail]=sample.jpg"

# updateテスト
# curl -X PATCH http://localhost:3000/api/v1/groups/1 -d "[user_id]=2"