# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

users = User.create(
  [
    {username: 'user', password: 'Abc!299282828', password_confirmation: 'Abc!299282828', created_at: Time.now, updated_at: Time.now},
    {username: 'user2', password: 'Abc!299282828', password_confirmation: 'Abc!299282828', created_at: Time.now, updated_at: Time.now}
  ]
)

# news = News.create(
#   [
#     {}
#   ]
# )
#
# comments = Comment.create(
#   [
#     {}
#   ]
# )
