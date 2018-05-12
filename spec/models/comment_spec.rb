require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'text' do
    it 'should not be nil' do
      comment = Comment.new({"id"=>1, "news_id"=>1, "user_username"=>""})
      comment.valid?
      expect(comment.messages.errors[:comment]).to include "Message can't be blank"
    end

    it 'should not be empty' do
      comment = Comment.new({"id"=>1, "news_id"=>1, "body"=>"", "user_username"=>""})
      comment.valid?
      expect(comment.messages.errors[:comment]).to include "Message can't be blank"
    end

    it 'should have more than 3 characters not including white space' do
      comment = Comment.new({"id"=>1, "news_id"=>1, "body"=>"", "user_username"=>""})

    end

    it 'should be less than 1000 characters' do
      comment = Comment.new({"id"=>1, "news_id"=>1, "body"=>"", "user_username"=>""})

    end
  end
end
