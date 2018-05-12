require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'username' do
    it 'should not have spaces' do
      user = User.new({"username"=>"ab c$","password"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "Username cannot contain spaces."
    end

    it 'should begin with a letter' do
      user = User.new({"username"=>"3abc$","password"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "Username must begin with a letter."
    end

    it 'should only contain alphanumeric characters' do
      user = User.new({"username"=>"abc$","password"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "Username can only contain letters, and numbers."
    end

    it 'should be shorter than 15 characters' do
      user = User.new({"username"=>"abcdefghijklmnop","password"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "Username must be between 2 and 15 characters."
    end

    it 'should longer than 2 characters' do
      user = User.new({"username"=>"a","password"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "Username must be between 2 and 15 characters."
    end

    it 'should be unique' do
      user = User.new({"username"=>"a","password"=>"password"})
      user2 = User.new({"username"=>"a","password"=>"password"})
      user2.valid?
      expect(user.errors.messages[:username]).to include "Username already taken."
    end
  end
  describe 'password' do
    it 'should be longer than 10 characters' do

    end
  end
end
