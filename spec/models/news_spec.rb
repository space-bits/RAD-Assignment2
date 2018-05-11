require 'rails_helper'

RSpec.describe News, type: :model do
  it 'should have a title' do
    news = News.new({"url"=>"https://...", "text"=>"Some text about the article"})
    news.valid?
    expect(news[:title]).not_to eql(nil)
  end

  it 'should have a url' do
    news = News.new({"title"=>"Article B", "text"=>"Some text about the article"})
    news.valid?
    expect(news[:url]).not_to eql(nil)
  end

  it 'should have some text' do
    news = News.new({"title"=>"Article B", "url"=>"http://..."})
    news.valid?
    expect(news[:text]).not_to eql(nil)
  end

  it 'should have a title that is a string' do
    news = News.new({"title"=>123})
    news.valid?
    expect(news.errors.messages[:title]).to include "Title must be a string"
  end

  it 'should have a url that is a string' do
    news = News.new({"url"=>123})
    news.valid?
    expect(news.errors.messages[:url]).to include "URL must be a string"
  end

  it 'should have text that is a string' do
    news = News.new({"text"=>123})
    news.valid?
    expect(news.errors.messages[:text]).to include "Text must be a string"
  end
end
