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
    {username: 'Rob', password: 'Abc!299282828', password_confirmation: 'Abc!299282828', created_at: Time.now, updated_at: Time.now},
    {username: 'Gabe', password: 'Abc!299282828', password_confirmation: 'Abc!299282828', created_at: Time.now, updated_at: Time.now}
  ]
)

news = News.create(
  [
    {by: 'Rob', text: 'There was once a gov\' conspiracy', url: 'Htpps://abc', title: 'Flat earth. p1'},
    {by: 'Rob', text: 'To keep the earth\'s flat nature', url: 'Https://', title: 'Flat earth. p2'},
    {by: 'Gabe', text: 'Butterflies are the greatest alien to invade Earth', url: 'https://google.com', title: 'Butterflies or Aliens p1'},
    {by: 'Gabe', text: 'In fact, the only reason that we don\'t already know, is because...', url: 'https://google.com', title: 'Butterflies or Aliens p2'},
  ]
)

# comments = Comment.create(
#   [
#     {news_id: 1, body: 'Hi'},
#     {news_id: 2, body: 'abc'},
#     {news_id: 3, body: '123123'},
#     {news_id: 4, body: 'xyz'}
#   ]
# )
