require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'by' do
    it 'should exist in the db' do

    end
  end

  describe 'title' do
    it 'should not be nil' do
      article = Article.new({"url"=>"https://..."})
      article.valid?
      expect(article.errors.messages[:title]).to include "can't be blank"
    end

    it 'should not be more than 200 characters' do
      article = Article.new({"title"=>"a"*201, "url"=>"https://..."})
      article.valid?
      expect(article.errors.messages[:title]).to include "must be between 10 and 200 characters"
    end

    it 'should not be less than 10 characters' do
      article = Article.new({"title"=>"a"*9, "url"=>"https://..."})
      article.valid?
      expect(article.errors.messages[:title]).to include "must be between 10 and 200 characters"
    end

    it 'should not be blank' do
      article = Article.new({"url"=>"https://...", "title"=>""})
      article.valid?
      expect(article.errors.messages[:title]).to include "can't be blank"
    end
  end

  describe 'url' do
    it 'should be a web address' do
      article = Article.new({"title"=>"Article B", "url"=>"Htpps://google.com"})
      article.valid?
      expect(article.errors.messages[:url]).to include "must be a valid url"
    end
  end
end
