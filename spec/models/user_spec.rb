require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should not have spaces' do

    user.valid?
    expect(user.errors.messages[]).to include ""
  end

  it 'should begin with a letter' do

    user.valid?
    expect(user.errors.messages[]).to include ""
  end

  it 'should only contain english alphanumeric characters' do
    user = User.new({"username"=>"abc$","password"=>"password"})
    user.valid?
    expect(user.errors.messages[]).to include ""
  end

  it 'should be no longer than 15 characters' do

  end

  it 'should be no shorter than 2 caharacters' do
    user = User.new({"username"=>"","password"=>"password"})
    user.valid?
    expect(user.errors.messages[]).to include ""
  end
end
