require 'rails_helper'

RSpec.describe News, type: :model do
  describe 'by' do
    it 'should be assigned to a user in the database' do
      
    end
  end

  describe 'title' do
    it 'should not be nil' do
      news = News.new({"url"=>"https://...", "text"=>"Some text about the article"})
      news.valid?
      expect(news.errors.messages[:title]).to include "Title can't be blank"
    end

    it 'should not be blank' do
      news = News.new({"url"=>"https://...", "title"=>"", "text"=>"Some text about the article"})
      news.valid?
      expect(news.errors.messages[:title]).to include "Title can't be blank"
    end

    it 'should have a title that is a string' do
      news = News.new({"title"=>123})
      news.valid?
      expect(news.errors.messages[:title]).to include "Title must be a string"
    end
  end

  describe 'url' do
    it 'should not be blank' do
      news = News.new({"title"=>"Article B", "text"=>"Some text about the article"})
      news.valid?
      expect(news.errors.messages[:url]).to include "Url can't be blank"
    end

    it 'should have a url that is a string' do
      news = News.new({"url"=>123})
      news.valid?
      expect(news.errors.messages[:url]).to include "Url must be a string"
    end
  end

  describe 'text' do
    it 'should not be nil' do
      news = News.new({"title"=>"Article B", "url"=>"http://..."})
      news.valid?
      expect(news.errors.messages[:text]).to include "Text can't be blank"
    end

    it 'should not be empty' do
      news = News.new({"title"=>"Article B", "text"=>"", "url"=>"http://..."})
      news.valid?
      expect(news.errors.messages[:text]).to include "Text can't be blank"
    end

    it 'should have text that is a string' do
      news = News.new({"title"=>"Article B", "text"=>123, "url"=>"http://..."})
      news.valid?
      expect(news.errors.messages[:text]).to include "Text must be a string"
    end

    it 'should be more than 10 characters' do
      news = News.new({"title"=>"Article B", "text"=>"abcdefghi", "url"=>"http://..."})
      news.valid?
      expect(news.errors.messages[:text]).to include "Text must be between 10 and 200 characters"
    end

    it 'should be less than 200 characters' do
      news = News.new({"title"=>"Article B",
        "text"=>"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "url"=>"http://..."})
      news.valid?
      expect(news.errors.messages[:text]).to include "Text must be between 10 and 200 characters"
    end
  end
end
