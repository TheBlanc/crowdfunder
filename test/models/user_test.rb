require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_email_must_be_unique
    user = User.create(email: "bettymaker@gmail.com", password: "12345678", password_confirmation: "12345678")
    user2 = User.new(email: "bettymaker@gmail.com", password: "00000000", password_confirmation: "00000000")
    refute user2.valid?
  end

  def test_user_must_include_password_confirmation_on_create
    user = User.new(email: "bettymaker@gmail.com", password: "12345678")
    refute user.valid?
  end

  def test_password_must_match_confirmation
    user = User.new(email: "bettymaker@gmail.com", password: "12345678", password_confirmation: "87654321")
    refute user.valid?
  end

  def test_password_must_be_at_least_8_characters_long
    user = User.new(email: "bettymaker@gmail.com", password: "1234", password_confirmation: "1234")
    refute user.valid?
  end

  def test_user_total_pledge
    user = create(:user)
    pledge1 = create(:pledge, dollar_amount: 10, user: user)
    pledge2 = create(:pledge, dollar_amount: 10, user: user)
    pledge3 = create(:pledge, dollar_amount: 10, user: user)
    pledge4 = create(:pledge, dollar_amount: 10, user: user)
    assert_equal(40, user.total_pledges)
  end
end
