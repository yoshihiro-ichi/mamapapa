require 'rails_helper'

RSpec.describe 'User', type: :model do
  before do
    @user = create(:user)
  end
  describe 'バリテーションのテスト' do

    it 'すべての入力欄を記入済みの場合バリテーションを通る' do
      expect(@user).to be_valid
    end

    it 'ユーザー名が未入力の場合バリテーションを通らない' do
      @user.name = nil
      expect(@user.valid?).to eq(false)
    end

    it 'ユーザー名が20文字以上の場合バリテーションを通らない' do
      @user.name = 'a'*21
      expect(@user.valid?).to eq(false)
    end

    it 'メールアドレス未入力の場合バリテーションを通らない' do
      @user.email = nil
      expect(@user.valid?).to eq(false)
    end

    it '規定外のメールアドレスの場合バリテーションを通らない' do
      @user.email =  '@a.com@'
      expect(@user.valid?).to eq(false)
    end

    it '重複したemailを入力した場合バリテーションを通らない' do
      user_a = create(:user2)
      user_b = build(:user2)
      user_b.valid?
      expect(user_a).to be_valid
      expect(user_b.errors[:email]).to include('はすでに存在します')
    end

    it 'emailが250文字以上の場合バリテーションを通らない' do
      @user.email = 'a'*251
      expect(@user.vaild?).to eq(false)
    end

    it 'パスワードが６文字以下の場合バリテーションを通らない' do
      @user.password =  '12345'
      @user.valid?
      expect(@user.errors[:password]).to include('は6文字以上で入力してください')
    end
  end
end
