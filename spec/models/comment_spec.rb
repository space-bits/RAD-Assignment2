require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'body' do
    it 'should not be nil' do
      comment = Comment.new({"id"=>1, "article_id"=>1, "user_id"=>1})
      comment.valid?
      expect(comment.messages.errors[:comment]).to include "Message can't be blank"
    end

    it 'should not be empty' do
      comment = Comment.new({"id"=>1, "article_id"=>1, "body"=>"", "user_id"=>1})
      comment.valid?
      expect(comment.messages.errors[:comment]).to include "Message can't be blank"
    end

    it 'should have more than 3 characters not including white space' do
      comment = Comment.new({"id"=>1, "article_id"=>1, "body"=>"a aa", "user_id"=>1})
      comment.valid?
      expect(comment.messages.errors[:comment]).to include "Message can't be blank"
    end

    it 'should be less than 1000 characters' do
      comment = Comment.new({"id"=>1, "article_id"=>1, "body"=>"a" * 1001, "user_id"=>1})
      comment.valid?
      expect(comment.messages.errors[:comment]).to include "Message can't be blank"
    end
  end

  describe 'article_id' do
    it 'should not be nil' do
      comment = Comment.new({"id"=>1, "body"=>"abcddef", "user_id"=>1})
      comment.valid?
      expect(comment.messages.errors[:comment]).to include "Message must belong to an article"
    end

    it 'should exist in the db' do
      comment = Comment.new({"id"=>1, "article_id"=>500, "body"=>"a" * 1001, "user_id"=>1})
      comment.valid?
      expect(comment.messages.errors[:comment]).to include "Message must belong to an article"
    end
  end

  describe 'user_id' do
    it 'should not be nil' do
      comment = Comment.new({"id"=>1, "article_id"=>2, "body"=>"abcddef"})
      comment.valid?
      expect(comment.messages.errors[:comment]).to include "Message must belong to a user"
    end

    it 'should exist in the db' do
      comment = Comment.new({"id"=>1, "article_id"=>2, "body"=>"abcdef", "user_id"=>102222200})
      comment.valid?
      expect(comment.messages.errors[:comment]).to include "Message must belong to a user"
    end
  end

end
