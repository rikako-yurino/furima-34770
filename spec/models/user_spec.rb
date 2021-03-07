require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規会員登録' do
    it 'すべての項目が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    
    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば保存できないこと' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password Include both letters and numbers")
    end

    it 'passwordが英数字を含まなければ保存できないこと' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it 'passwordが存在してもpassword_confirmationが空では保存できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空では保存できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角カナ漢字平仮名ではないとき保存できないこと' do
      @user.last_name = "lastname"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end

    it 'first_nameが空では保存できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角カナ漢字平仮名ではないとき保存できないこと' do
      @user.last_name = "namae"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end

    it 'last_name_kanaが空では保存できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'last_name_kanaが全角カタカナではないとき保存できないこと' do
      @user.last_name_kana = "せい"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana  Full-width katakana characters")
    end

    it 'first_name_kanaが空では保存できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'first_name_kanaが全角カタカナではないとき保存できないこと' do
      @user.first_name_kana = "めい"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana  Full-width katakana characters")
    end

    it 'birthdayが空では保存できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
