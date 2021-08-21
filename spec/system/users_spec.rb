require 'rails_helper'
RSpec.describe 'User関連機能', type: :system do
  let!(:user){ FactoryBot.create(:user,email: 'yoshi@a.com') }
  before do
    visit root_path
  end
  describe '新規登録機能' do
   context '全ての記述が正しい場合' do
      it '新規登録できる' do
       click_on "新規登録"
       fill_in "user[name]", with: "いち"
       fill_in "user[email]", with: "a@a.com"
       fill_in "user[password]", with: "123456"
       fill_in "user[password_confirmation]", with: "123456"
       click_button 'commit'
       expect(page).to have_content '施設投稿一覧'
       expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
    context '入力欄が空だった場合' do
      it '新規登録出来ずエラー文が出る' do
        click_on "新規登録"
        click_on "commit"
        expect(page).to have_content'5 件のエラーが発生したため ユーザー は保存されませんでした。'
      end
    end
  end
  describe 'ログイン機能' do
    context '全ての記述が正しい場合' do
       it 'ログインできる' do
         click_on "ログイン"
         fill_in "user[email]",with: "yoshi@a.com"
         fill_in "user[password]", with: "123456"
         click_on "commit"
         expect(page).to have_content 'ログインしました'
      end
    end
    context 'emailとpasswordが一致しない場合' do
       it 'ログインできない' do
        click_on "ログイン"
        fill_in "user[email]",with: "yoshi@a.com"
        fill_in "user[password]", with: "987654"
        click_on "commit"
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      end
    end
    context 'ゲストログインを選ぶと' do
      it 'ゲストログインとして入力なしでログインできる' do
       find('.guest').click
       expect(page).to have_content "ゲストユーザーとしてログインしました。"
       expect(page).to have_no_content"管理画面へ"
      end
    end
    context '管理者ログインを選ぶと' do
        it '管理者として入力なしでログインできる' do
         find('.admin').click
         expect(page).to have_content "管理ユーザーとしてログインしました。"
         expect(page).to have_content "管理画面へ"
      end
    end
  end
end
