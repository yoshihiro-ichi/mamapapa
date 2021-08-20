require 'rails_helper'
describe '施設モデル機能', type: :model do
  let!(:user) {create(:user)}
  let!(:facility) {create(:facility, user_id: user.id)}

  describe 'バリデーションテスト' do
    context '施設名の入力が正しい場合' do
      it '新規作成ができる' do
        expect(facility).to be_valid
      end
    end

    context '施設名が20文字以上の場合' do
      it 'バリデーションエラーとなる' do
        facility.title = 'a'*21
        expect(facility).to be_invalid
      end
    end
    context '施設名の入力がない場合' do
      it 'バリデーションエラーになる' do
        facility.title = nil
        expect(facility).to be_invalid
      end
    end
    context 'コンテントが300文字以上の場合' do
      it 'バリデーションエラーになる' do
        facility.content = 'a'*301
        expect(facility).to be_invalid
      end
    end
    context 'レビューの入力が無記入の場合' do
      it 'バリデーションエラーになる' do
        facility.content= nil
        expect(facility).to be_invalid
      end
    end
    context 'レビューの入力されている場合' do
      it '新規作成できる' do
        expect(facility).to be_valid
      end
    end

    context '住所が正しく入力されている場合' do
      it '新規作成ができる' do
        expect(facility).to be_valid
      end
    end
    context '都道府県が入力さていない場合' do
      it 'バリデーションエラーになる' do
        facility.prefecture = nil
        expect(facility).to be_invalid
      end
    end
    context '都道府県が4文字以上の場合' do
      it 'バリデーションエラーとなる' do
        facility.prefecture  = 'a'*5
        expect(facility).to be_invalid
      end
    end
  end
end
