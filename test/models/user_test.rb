require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_factory_is_valid
    user = build(:user)
    assert user.valid?
  end

  def test_email_must_be_unique
    user = create(:user)
    user2 = build(:user, email: user.email)
    user2.save
      # puts user2.errors.inspect
    assert  user2.errors.messages.keys.include?(:email)
  end

  def test_user_must_include_password_confirmation_on_create
     user = build(:user , password_confirmation: nil)
    refute user.valid?
      # puts user2.errors.inspect
  end

  def test_password_must_match_confirmation
    user = build(:user, password_confirmation: "564637ce")
    refute user.valid?

  end

  def test_password_must_be_at_least_8_characters_long
   user2 = build(:user, password: "6543", password_confirmation: "6543")
    refute user2.valid?
  end
end
