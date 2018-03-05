require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new({
        first_name: Faker::Name.first_name,
        surname: Faker::Name.last_name,
        email: "test@test.com",
        password: "Testing",
        password_confirmation: "Testing",
      })
    end

    it 'tests to make sure a new user is created with the right validations' do
      @user.save

      expect(@user).to be_valid
    end

    it 'tests to make sure that passwords are case sensitive' do
      @user.password_confirmation = "testing"

      @user.save

      expect(@user.password).not_to eq (@user.password_confirmation)
    end

    it 'tests to ensure that a password is typed in before saving registration' do
      @user.password = nil
      @user.password_confirmation = nil

      @user.save

      expect(@user).to_not be_valid
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'tests to ensure that someone can not register with the same email regardless of case' do
      @user.save

      expect(@user.email).to_not eq("TEST@test.com")
    end

    it 'makes sure that first_name, surname and email are not left blank' do
      @user.first_name = nil
      @user.surname = nil
      @user.email = nil

      @user.save

      expect(@user).to_not be_valid
      expect(@user.errors[:first_name]).to include("can't be blank")
      expect(@user.errors[:surname]).to include("can't be blank")
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'checks if a password has a minimum length of 6' do
        @user.password = "test"

        @user.save

        expect(@user).to_not be_valid
        expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end
