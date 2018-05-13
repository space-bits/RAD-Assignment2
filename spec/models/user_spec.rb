require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'username' do
    it 'should not have spaces' do
      user = User.new({"username"=>"ab c$", "password"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "Username cannot contain spaces"
    end

    it 'should begin with a letter' do
      user = User.new({"username"=>"3abc$", "password"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "Username must begin with a letter"
    end

    it 'should only contain alphanumeric characters' do
      user = User.new({"username"=>"abc0_-$", "password"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "Username can only contain letters, digits, dashes, and underscores"
    end

    it 'should at most 15 characters' do
      user = User.new({"username"=>"abcdefghijklmnop","password"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "Username must be between 2 and 15 characters"
    end

    it 'should be at least 2 characters' do
      user = User.new({"username"=>"a","password"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "Username must be between 2 and 15 characters"
    end

    it 'should be unique' do
      user = User.new({"username"=>"a","password"=>"password"})
      user2 = User.new({"username"=>"a","password"=>"password"})
      user2.valid?
      expect(user.errors.messages[:username]).to include "Username must be a unique username in the database"
    end
  end

  # test cases for passwords
  describe 'password' do
    it 'should be at least 10 characters' do
      user = User.new({"username"=>"abc","password"=>"Aa!345678"})
      user.valid?
      expect(user.errors.messages[:password]).to include "Password must be at least 10 characters"
    end

    it 'should contain at least 1 special characters' do
      user = User.new({"username"=>"abc","password"=>"Aa2345678000"})
      user.valid?
      expect(user.errors.messages[:password]).to include "Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 special character, and 1 number"
    end

    it 'should contain at least 1 uppercase letter' do
      user = User.new({"username"=>"abc","password"=>"0a!345678000"})
      user.valid?
      expect(user.errors.messages[:password]).to include "Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 special character, and 1 number"
    end

    it 'should contain at least 1 lowercase letter' do
      user = User.new({"username"=>"abc","password"=>"A1!345678000"})
      user.valid?
      expect(user.errors.messages[:password]).to include "Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 special character, and 1 number"
    end
  end
end
