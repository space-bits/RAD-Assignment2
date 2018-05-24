require 'rails_helper'

RSpec.describe Comment, type: :model do

  # def setup
  #   @comment = Comment.new(article_id: 1, body: "Abcdefasdj", user_id: 1)
  # end

  describe 'validations' do
    subject(:comment) { Comment.new }
    before { comment.valid? }

    it 'should validate presence of an article' do
      expect(comment.errors[:article_id].size).to be >= 1
      expect(comment.errors.messages[:article_id]).to include "can't be blank"
    end

    it 'should validate presence of body' do
      expect(comment.errors[:body].size).to be >= 1
      expect(comment.errors.messages[:body]).to include "can't be blank"
    end
  end

  describe 'body' do
    it 'should not be nil' do
      comment = Comment.new({"article_id"=>1, "user_id"=>1})
      comment.valid?
      expect(comment.errors.messages[:body]).to include "can't be blank"
    end

    it 'should not be empty' do
      comment = Comment.new({"article_id"=>1, "body"=>"", "user_id"=>1})
      comment.valid?
      expect(comment.errors.messages[:body]).to include "can't be blank"
    end

    it 'should have more than 3 characters not including white space' do
      comment = Comment.new({"article_id"=>1, "body"=>"a" * 2, "user_id"=>1})
      comment.valid?
      expect(comment.errors.messages[:body]).to include "must be between 3 and 1000 characters"
    end

    it 'should be less than 1000 characters' do
      comment = Comment.new({"article_id"=>1, "body"=>"a" * 1001, "user_id"=>1})
      comment.valid?
      expect(comment.errors.messages[:body]).to include "must be between 3 and 1000 characters"
    end
  end

  describe 'article_id' do
    it 'should not be nil' do
      comment = Comment.new({"body"=>"abcddef", "user_id"=>1})
      comment.valid?
      expect(comment.errors.messages[:article_id]).to include "can't be blank"
    end

    it 'should exist in the db' do
      comment = Comment.new({"article_id"=>500, "body"=>"abcasd", "user_id"=>1})
      expect(Article.exists?(comment[:article_id])).to be_falsey
    end
  end

  describe 'user_id' do
    it 'should not be nil' do
      comment = Comment.new({"article_id"=>2, "body"=>"abcddef"})
      comment.valid?
      expect(comment.errors.messages[:user_id]).to include "can't be blank"
    end

    it 'should exist in the db' do
      comment = Comment.new({"article_id"=>2, "body"=>"abcdef", "user_id"=>102222200})
      expect(User.exists?(comment[:user_id])).to be_falsey
    end
  end

end
