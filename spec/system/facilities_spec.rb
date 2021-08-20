require 'rails_helper'
RSpec.describe '施設投稿機能', type: :system do
  let!(:user){ FactoryBot.create(:user,email: 'yoshi@a.com') }
  let!(:facility) { FactoryBot.create(:facility,user_id: user.id)}
  let!(:facility){ FactoryBot.create(:facility)}
  # let!(:facility){create(:facility2)}
  # let!(:facility){create(:facility3,)}
  before do
    visit new_user_session_path
    fill_in :user_email, with: "yoshi@a.com"
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








end
