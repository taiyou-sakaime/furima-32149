require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user= FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録'do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemailとencrypted_passwordとpassword_confirmationとlast_nameとfirst_nameとlast_name_katakanaとfirst_name_katakanaとbirthday
      が存在すれば新規登録できる'do
       expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時'do
      it 'nicknameが空だと新規登録できない' do
        @user.nickname =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと新規登録できない' do
        @user.email =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに＠が存在しないと新規登録できない' do
        @user.email ="aaaexample"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと新規登録できない' do
        @user.password =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空だと新規登録できない' do
        @user.password_confirmation =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合はできない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordは半角英数混合以外では保存できない' do
        @user.password ="aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角数字と半角英字の両方を含めて設定してください")
      end
      it 'passwordが数字のみだと保存できない' do
        @user.password ="111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角数字と半角英字の両方を含めて設定してください")
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password ="aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には半角数字と半角英字の両方を含めて設定してください")
      end
      it 'passwordは6文字以上でないと新規登録できない' do
        @user.password ="aa1a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationは同じでないといけない' do
        @user.password ="a1a1aa"
        @user.password_confirmation = "a1a1ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと新規登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameは全角（漢字、ひらがな、カタカナ）でないと登録できない' do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameが空だと新規登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameは全角（漢字、ひらがな、カタカナ）でないと登録できない' do
        @user.first_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_name_katakanaが空だと新規登録できない' do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it 'last_name_katakanaは全角（カタカナ）でないと登録できない' do
        @user.last_name_katakana = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end
      it 'first_name_katakanaが空だと新規登録できない' do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it 'first_name_katakanaは全角（カタカナ）でないと登録できない' do
        @user.first_name_katakana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end
      it 'birthdayが空だと新規登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end 
  

