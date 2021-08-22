require 'rails_helper'
RSpec.describe 'コメント機能', type: :system do
  let!(:user){ FactoryBot.create(:user,email: 'yoshi@a.com') }
  let!(:facility){FactoryBot.create(:facility)}
  before do
    visit new_user_session_path
    fill_in :user_email, with: "yoshi@a.com"
    fill_in :user_password, with: "123456"
    click_on 'commit'
  end

  describe '投稿に対してコメントを投稿機能' do
    context '投稿にコメントした場合' do
      it '投稿にコメントが投稿される' do
        click_on '詳細へ'
        fill_in :comment_content, with: "こんにちは"
        click_on '登録する'
        # binding.pry
        click_button 'commit'
        expect(page).to have_content 'こんにちは'
      end
    end

    context '投稿したコメントの削除ボタンを押した場合' do
        it 'コメントを削除できる' do
          click_on '詳細へ'
          fill_in :comment_content, with: "こんにちは"
          click_button 'commit'
          click_on '削除'
          page.driver.browser.switch_to.alert.accept
          expect(page).not_to have_content 'こんにちは'
        end
      end

  end
end
