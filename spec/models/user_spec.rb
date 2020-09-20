require 'rails_helper'

RSpec.describe User, type: :model do
describe '#create' do
  before do
    @user = FactoryBot.build(:user)
  end

  it "全て存在すれば登録できること" do
    expect(@user).to be_valid
  end

  it "nicknameが空では登録できないこと" do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it "emailが空では登録できないこと" do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it "emailに@ないと登録できないこと" do
    @user.email = 'aaaa.com'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email メールアドレスには@を入力してください")
  end

  it "passwordが空では登録できないこと" do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it "passwordが8文字未満では登録できないこと" do
    @user.password = 'qwe123'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password パスワードは8文字以上入力してください。")
  end

  it "passwordが英字だけでは登録できないこと" do
    @user.password = 'qwertyui'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password パスワードは英数字混合で入力してください。")
  end

  it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
    @user.password_confirmation = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  end
end