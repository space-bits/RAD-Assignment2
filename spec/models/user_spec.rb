require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'username' do
    it 'should not have spaces' do
      user = User.new({"username"=>"ab c$", "password"=>"password", "password_confirmation"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "can only contain letters, digits, dashes, and underscores"
    end

    it 'should begin with a letter' do
      user = User.new({"username"=>"3abc$", "password"=>"password", "password_confirmation"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "can only contain letters, digits, dashes, and underscores"
    end

    it 'should only contain alphanumeric characters' do
      user = User.new({"username"=>"abc0_-$", "password"=>"password", "password_confirmation"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "can only contain letters, digits, dashes, and underscores"
    end

    it 'should at most 15 characters' do
      user = User.new({"username"=>"a" * 16,"password"=>"password", "password_confirmation"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "must be between 2 and 15 characters"
    end

    it 'should be at least 2 characters' do
      user = User.new({"username"=>"a","password"=>"password", "password_confirmation"=>"password"})
      user.valid?
      expect(user.errors.messages[:username]).to include "must be between 2 and 15 characters"
    end

    it 'should be unique' do
      user = User.new({"username"=>"abc","password"=>"password", "password_confirmation"=>"password"})
      user2 = User.new({"username"=>"abc","password"=>"password", "password_confirmation"=>"password"})
      user.save
      user2.valid?
      expect(user.errors.messages[:username]).to include "has already been taken"
      user.destroy
    end
  end

  # test cases for passwords
  describe 'password' do
    it 'should be at least 10 characters' do
      user = User.new({"username"=>"abc", "password"=>"a" * 9, "password_confirmation"=>"a" * 9})
      user.valid?
      expect(user.errors.messages[:password]).to include "must be at least 10 characters"
    end

    it 'should contain at least 1 special characters' do
      user = User.new({"username"=>"abc","password"=>"Aa2345678000", "password_confirmation"=>"Aa2345678000"})
      user.valid?
      expect(user.errors.messages[:password]).to include "must contain at least 1 uppercase letter, 1 lowercase letter, 1 special character, and 1 number"
    end

    it 'should contain at least 1 uppercase letter' do
      user = User.new({"username"=>"abc","password"=>"0a!345678000", "password_confirmation"=>"0a!345678000"})
      user.valid?
      expect(user.errors.messages[:password]).to include "must contain at least 1 uppercase letter, 1 lowercase letter, 1 special character, and 1 number"
    end

    it 'should contain at least 1 lowercase letter' do
      user = User.new({"username"=>"abc","password"=>"A1!345678000", "password_confirmation"=>"A1!345678000"})
      user.valid?
      expect(user.errors.messages[:password]).to include "must contain at least 1 uppercase letter, 1 lowercase letter, 1 special character, and 1 number"
    end
  end
end
