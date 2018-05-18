require 'rails_helper'

RSpec.describe articles, type: :model do
  describe 'by' do
    it 'should be assigned to a user in the database' do
      
    end
  end

  describe 'title' do
    it 'should not be nil' do
      articles = articles.new({"url"=>"https://...", "text"=>"Some text about the article"})
      articles.valid?
      expect(articles.errors.messages[:title]).to include "Title can't be blank"
    end

    it 'should not be blank' do
      articles = articles.new({"url"=>"https://...", "title"=>"", "text"=>"Some text about the article"})
      articles.valid?
      expect(articles.errors.messages[:title]).to include "Title can't be blank"
    end

    it 'should have a title that is a string' do
      articles = articles.new({"title"=>123})
      articles.valid?
      expect(articles.errors.messages[:title]).to include "Title must be a string"
    end
  end

  describe 'url' do
    it 'should not be blank' do
      articles = articles.new({"title"=>"Article B", "text"=>"Some text about the article"})
      articles.valid?
      expect(articles.errors.messages[:url]).to include "Url can't be blank"
    end

    it 'should have a url that is a string' do
      articles = articles.new({"url"=>123})
      articles.valid?
      expect(articles.errors.messages[:url]).to include "Url must be a string"
    end
  end

  describe 'text' do
    it 'should not be nil' do
      articles = articles.new({"title"=>"Article B", "url"=>"http://..."})
      articles.valid?
      expect(articles.errors.messages[:text]).to include "Text can't be blank"
    end

    it 'should not be empty' do
      articles = articles.new({"title"=>"Article B", "text"=>"", "url"=>"http://..."})
      articles.valid?
      expect(articles.errors.messages[:text]).to include "Text can't be blank"
    end

    it 'should have text that is a string' do
      articles = articles.new({"title"=>"Article B", "text"=>123, "url"=>"http://..."})
      articles.valid?
      expect(articles.errors.messages[:text]).to include "Text must be a string"
    end

    it 'should be more than 10 characters' do
      articles = articles.new({"title"=>"Article B", "text"=>"abcdefghi", "url"=>"http://..."})
      articles.valid?
      expect(articles.errors.messages[:text]).to include "Text must be between 10 and 200 characters"
    end

    it 'should be less than 200 characters' do
      articles = articles.new({"title"=>"Article B",
        "text"=>"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        "url"=>"http://..."})
      articles.valid?
      expect(articles.errors.messages[:text]).to include "Text must be between 10 and 200 characters"
    end
  end
end
