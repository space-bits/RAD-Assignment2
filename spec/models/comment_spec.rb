require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'text' do
    it 'should not be blank' do
      comment = Comment.new({"news_id"=>"", "comment"=>""})
    end

    it 'should have more than 3 characters not including white space' do

    end

    it 'should be less than 1000 characters' do

    end
  end
end
