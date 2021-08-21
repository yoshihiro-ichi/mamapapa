require 'rails_helper'
RSpec.describe '施設投稿機能', type: :system do
  let!(:user){ FactoryBot.create(:user,email: 'yoshi@a.com') }
  let!(:user){ FactoryBot.create(:user2,email: 'yoshi2@a.com') }
  let!(:user){ FactoryBot.create(:user3,email: 'yoshi3@a.com') }
  let!(:facility) { FactoryBot.create(:facility,user_id: user.id)}
  let!(:facility2){FactoryBot.create(:facility2,user_id:user.id)}
  let!(:facility3){FactoryBot.create(:facility3,user_id:user.id)}

  before do
    visit new_user_session_path
    fill_in :user_email, with: "yoshi@a.com"
    fill_in :user_password, with: "123456"
    click_on 'commit'
    visit new_user_session_path
    fill_in :user_email, with: "yoshi2@a.com"
    fill_in :user_password, with: "123456"
    click_on 'commit'
    visit new_user_session_path
    fill_in :user_email, with: "yoshi3@a.com"
    fill_in :user_password, with: "123456"
    click_on 'commit'
  end
  describe '新規作成機能' do
    context '施設を新規作成した場合' do
      it '作成した施設が表示される' do
        visit new_facility_path
        fill_in 'facility[title]', with: '喫茶ロード'
        fill_in 'facility_content', with: 'テスト1'
        fill_in 'facility_prefecture',with: '東京'
        fill_in 'facility_address',with: '昭島市'
        fill_in 'facility_types' ,with: '屋内'
        click_button '登録する'
        visit facilities_path
        expect(page).to have_content '喫茶ロード'
        expect(page).to have_content 'テスト1'
        expect(page).to have_content '東京'
        expect(page).to have_content '昭島市'
        expect(page).to have_content '屋内'
      end
    end
  end
  before  do
    visit facilities_path
  end
  describe '一覧表示機能' do
    context '一覧画面に移行した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit facilities_path
          expect(page).to have_content '喫茶ロード'
      end
    end
    context '施設投稿作成日時の降順に並んでいる場合'do
      it '新しいタスクが一番上に表示される' do
        facility_list = all('.facility_low')
          expect(facility_list[0]).to have_content 'タイトル3'

      end
    end
  end




end
