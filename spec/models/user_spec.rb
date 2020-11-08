require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  
 describe 'ユーザー新規登録' do
   context '新規登録がうまくいくとき' do
    it "入力項目すべてが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "passwordが6文字以上で英数混合であれば登録できる" do
      @user.password = "1234abc"
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
    end
   end

   context '新規登録がうまくいかないとき' do
     it "nicknameが空だと登録できない" do  # ニックネームが必須であること
       @user.nickname = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do # メールアドレスが必須であること
       @user.email = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "重複したemailが存在する場合登録できない" do # メールアドレスが一意性であること
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include("Email has already been taken")
       # expect(another_user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank", "First name kana can't be blank", "Last name kana can't be blank", "Birthday can't be blank")
     end
     it "passwordが空では登録できない" do # パスワードが必須であること
       @user.password = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it "passwordが5文字以下であれば登録できない" do # パスワードは6文字以上であること
       @user.password = "00000"
       @user.password_confirmation = "00000"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it "passwordが存在してもpassword_confirmationが空では登録できない" do #パスワードは確認用も含めて2回入力すること
       @user.password_confirmation = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     # メールアドレスは@を含む必要があること
     # パスワードは半角英数字混合であること
   end
 end
end