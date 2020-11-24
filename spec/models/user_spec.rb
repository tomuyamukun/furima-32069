require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do

      it "nickname、email,passwprd,password_confirmation,last_name_kanji,
      first_name_kanji,last_name_kana,first_name_kana,birthdayがあれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上かつ英数字両方含むと登録できる" do
        @user.password = "a0a0a0"
        @user.password_confirmation = "a0a0a0"
        expect(@user).to be_valid
      end

      it "last_name_kanjiが漢字だと登録できる" do
        @user.last_name_kanji = "亜"
        expect(@user).to be_valid

      end
      it "first_name_kanjiが漢字だと登録できる" do
        @user.first_name_kanji = "火"
        expect(@user).to be_valid
      end
      it "last_name_kanaが全角カタカナだと登録できる" do
        @user.last_name_kana = "カナ"
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カタカナだと登録できる" do
        @user.first_name_kana = "カタ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまく行かないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複すると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "password が空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが半角英字だけだと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字だけだと登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが５文字以下だと登録できない" do
        @user.password = "a0a0a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_name_kanjiが空だと登録できない" do
        @user.last_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it "first_name_kanjiが空だと登録できない" do
        @user.first_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it "last_name_kana空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kana全角カナでないと登録できない" do
        @user.last_name_kana = "さとう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")

      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaが全角カナでないと登録できない" do
        @user.first_name_kana = "漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end


  end
end
