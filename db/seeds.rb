# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
  [
    {
      username: 'Rob',
      password: 'Abc!299282828',
      password_confirmation: 'Abc!299282828',
    },
    {
      username: 'Gabe',
      password: 'Abc!299282828',
      password_confirmation: 'Abc!299282828'
    },
    {
      username: 'Jonathon',
      password: 'Abc!299282828',
      password_confirmation: 'Abc!299282828'
    },
    {
      username: 'Ben',
      password: 'Abc!299282828',
      password_confirmation: 'Abc!299282828'
    },
    {
      username: 'gabriel',
      password: 'Thecake1sal1e',
      password_confirmation: 'Thecake1sal1e'
    }
  ]
)

articles = Article.create(
  [
    {
      by: 'Rob',
      url: 'Htpps://abc',
      title: 'Flat earth. p1'
    },
    {
      by: 'Rob',
      url: 'Https://',
      title: 'Flat earth. p2'
    },
    {
      by: 'Gabe',
      url: 'https://google.com',
      title: 'Butterflies or Aliens p1'
    },
    {
      by: 'Gabe',
      url: 'https://google.com',
      title: 'Butterflies or Aliens p2'
    },
    {
      by: 'Jonathon',
      url: 'https://google.com',
      title: 'Moon landing spoof'
    },
    {
      by: 'Jonathon',
      url: 'https://google.com',
      title: 'Russia winning space War'
    },
    {
      by: 'Ben',
      url: 'https://google.com',
      title: 'Bright Idea'
    },
    {
      by: 'Ben',
      url: 'https://google.com',
      title: 'Dull Idea'
    }
  ]
)

comments = Comment.create(
  [
    {
      article_id: articles.first.id,
      body: 'Hi, I don\'t really buy this whole conspiracy theory argument.'
    },
    {
      article_id: articles.first.id,
      body: 'Uhh, look, even if there /were/ a gov\'t conspiracy. What\'s the point?'
    },
    {
      article_id: articles.second.id,
      body: 'This is ridiculous, I mean, where\'s the proof?!'
    },
    {
      article_id: articles.second.id,
      body: 'Gotta hide the truth',
      created_at: Time.new(2018)
    },
    {
      article_id: articles.third.id,
      body: 'It has always bothered me the way that butterflies \'evolve\'...',
      created_at: Time.new(2018)
    },
    {
      article_id: articles.third.id,
      body: 'Butterflies, or not butterflies',
      created_at: Time.new(2018)
    },
    {
      article_id: articles.fourth.id,
      body: 'Maybe the butterflies got to him too',
      created_at: Time.new(2011)
    },
    {
      article_id: articles.fifth.id,
      body: 'I knew it I sent my own rocket to the Moon',
      created_at: Time.new(2012)
    },
    {
      article_id: articles.fifth.id,
      body: 'Russia is the best',
      created_at: Time.new(2012)
    }
  ]
)
