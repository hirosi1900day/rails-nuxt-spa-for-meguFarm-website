require 'test_helper'

class UserTest < ActiveSupport::TestCase
 def setup 
  @user = active_users
 end
 test "name_validation" do
  user = User.new(email: "test@emaile", password: "password")
  user.save
  require_msg = ["名前を入力してください"]
  assert_equal(require_msg, user.errors.full_messages)

  max = 30
  name = "a" * (max + 1)
  user.name = name 
  user.save
  max_length_msg = ["名前は30文字以内で入力してください"]
  assert_equal(max_length_msg, user.errors.full_messages)
 end

 test "email_validation" do
  user = User.new(name: "test", password: "password")
  user.save
  require_msg = ["メールアドレスを入力してください"]
  assert_equal(require_msg, user.errors.full_messages)

  max = 255
  domain = "@exampe.com" 
  email = "a" * (max + 1 - domain.length) + domain

  user.name = name 
  user.save
  max_length_msg = ["メールアドレスは255文字以内で入力してください"]
  assert_equal(max_length_msg, user.errors.full_messages)
 end

 test "active_user_uniqueness" do
  #いる場合
  #いない場合
  email = "test@email.com"
  count = 3
  assert_difference("User.count", count) do
    count.times do |n|
      User.create(name: "test", email: email, password: "password")
    end
 end


 active_user = User.find_by(email: email)
 active_user.update!(activated: true)
 assert active_user.activated

 assert_no_difference("User.count") do
  user = User.new(name: "test", email: "email", password: "password")
  user.save
 end
 acitve_user.de
 end

 test "password_validation" do
  # 入力必須
  user = User.new(name: "test", email: "test@example.com")
  user.save
  required_msg = ["パスワードを入力してください"]
  assert_equal(required_msg, user.errors.full_messages)

  # min文字以上
  min = 8
  user.password = "a" * (min - 1)
  user.save
  minlength_msg = ["パスワードは8文字以上で入力してください"]
  assert_equal(minlength_msg, user.errors.full_messages)

  # max文字以下
  max = 72
  user.password = "a" * (max + 1)
  user.save
  maxlength_msg = ["パスワードは72文字以内で入力してください"]
  assert_equal(maxlength_msg, user.errors.full_messages)

  # 書式チェック VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
  ok_passwords = %w(
    pass---word
    ________
    12341234
    ____pass
    pass----
    PASSWORD
  )
  ok_passwords.each do |pass|
    user.password = pass
    assert user.save
  end

  ng_passwords = %w(
    pass/word
    pass.word
    |~=?+"a"
    １２３４５６７８
    ＡＢＣＤＥＦＧＨ
    password@
  )
  format_msg = ["パスワードは半角英数字•ﾊｲﾌﾝ•ｱﾝﾀﾞｰﾊﾞｰが使えます"]
  ng_passwords.each do |pass|
    user.password = pass
    user.save
    assert_equal(format_msg, user.errors.full_messages)
  end
 end
end
