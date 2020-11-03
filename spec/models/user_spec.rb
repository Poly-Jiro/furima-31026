require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email、password,password_confirmation,family_name,family_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスが一意性を持たないと登録できない" do
        @user.save
        another_email = FactoryBot.build(:user)
        another_email.email = @user.email
        another_email.valid?
        expect(another_email.errors.full_messages).to include("Email has already been taken") 
      end
      it "メールアドレスは@を含まないと登録できない" do
        @user.email = @user.email.delete("@") 
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードの入力がないと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは、6文字以上で入力しないと登録できない" do
        @user.password = "a1111"
        @user.password_confirmation = "a1111" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードが半角英数混合(数字だけ)で入力しないと登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英数混合で設定してください")
      end
      it "パスワードが半角英数混合(英語だけ)で入力しないと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英数混合で設定してください")
      end
      it "パスワードは、確認用を含めて2回同じものを入力しないと登録できない" do
        @user.password = "1aaaaaa"
        @user.password_confirmation = "2bbbbb" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー苗字が存在しないと登録できない" do
        @user.family_name = "" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name 全角文字を使用してください")
      end
      it "ユーザー名前が存在しないと登録できない" do
        @user.first_name = "" 
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角文字を使用してください")
      end
      it "ユーザー苗字は全角で入力しないと登録できない" do
        @user.family_name = "donald" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end
      it "ユーザー名前は全角で入力しないと登録できない" do
        @user.first_name = "trump" 
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "ユーザー苗字のフリガナが存在しないと登録できない" do
        @user.family_name_kana = "" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "ユーザー名前のフリガナが存在しないと登録できない" do
        @user.first_name_kana = "" 
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "ユーザー苗字フリガナは全角で入力しないと登録できない" do
        @user.family_name_kana = "donald" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角カタカナを使用してください")
      end
      it "ユーザー名前フリガナは全角で入力しないと登録できない" do
        @user.first_name_kana = "trump" 
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end
      it "生年月日が存在しないと登録できない" do
        @user.birthday = "" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end