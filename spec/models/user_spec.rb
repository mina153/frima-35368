  require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できるとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end

      it 'emailが@を含めば登録できる' do
        @user.email = 'test@test.com'
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end

      it 'passwordが半角英数字混合での入力であれば登録できること' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが同じだと保存できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailが＠を含まないと保存できないこと' do
        @user.email= 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end  

      it 'passwordが空だと保存できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できないこと' do
        @user.password='00000'
        @user.password_confirmation='00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが半角英数字混合での入力がなければ登録できないこと' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
       end

       it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '890iop'
        @user.password_confirmation = '123qwe'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空だと登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'first_nameが空だと保存できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_nameが全角日本語でないと保存できないこと' do
        @user.family_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end

      it 'first_nameが全角日本語でないと保存できないこと' do
        @user.first_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it 'family_name_readingが空だと保存できないこと' do
        @user.family_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading can't be blank")
      end
      
      it 'first_name_readingが空だと保存できないこと' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end

      it 'family_name_readingが全角（カタカナ）でないと登録できないこと' do
        @user.family_name_reading = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid. Input full-width katakana characters.")
      end

      it 'first_name_readingが全角（カタカナ）でないと登録できないこと' do
        @user.first_name_reading = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
      end

      it '生年月日がなければ登録できないこと' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

    end
  end
end



# describe 'ユーザー新規登録' do
#   context '新規登録できるとき' do
#     it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
#       expect(@user).to be_valid
#     end
#     it 'nicknameが6文字以下であれば登録できる' do
#       @user.nickname = 'aaaaaa'
#      expect(@user).to be_valid
#     end
#     it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
#       @user.password = '000000'
#       @user.password_confirmation = '000000'
#      expect(@user).to be_valid
#     end
#   end
#   context '新規登録できないとき' do
#     it 'nicknameが空では登録できない' do
#       @user.nickname= ''
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Nickname can't be blank")
#     end
#     it 'emailが空では登録できない' do
#       @user.email= ''
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Email can't be blank")
#     end
#     it 'passwordが空では登録できない' do
#       @user.password= ''
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Password can't be blank")
#     end
#     it 'passwordが存在してもpassword_confirmationが空では登録できない' do
#       @user.password_confirmation= ''
#       @user.valid?    
#       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
#     end
#     it 'nicknameが7文字以上では登録できない' do
#       @user.nickname='aaaaaaa'
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 6 characters)")
#     end
#     it '重複したemailが存在する場合登録できない' do
#       @user.save
#       another_user = FactoryBot.build(:user)
#       another_user.email = @user.email
#       another_user.valid?
#       expect(another_user.errors.full_messages).to include('Email has already been taken')
    
#     end
#     it 'passwordが5文字以下では登録できない' do
#       @user.password='00000'
#       @user.password_confirmation='00000'
#       @user.valid?
#       expect(@user.errors.full_messages).to include("Password is too short(minimum is 6 characters)")
#     end
#   end
# end