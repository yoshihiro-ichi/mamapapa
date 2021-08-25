require 'rails_helper'
RSpec.describe '施設投稿機能', type: :system do
  let!(:user){ FactoryBot.create(:user,email: 'yoshi@a.com') }
  let!(:facility) { FactoryBot.create(:facility,user_id:user.id)}
  let!(:facility2){FactoryBot.create(:facility2)}
  let!(:facility3){FactoryBot.create(:facility3)}
  let!(:facility4){FactoryBot.create(:facility4)}
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
        select '東京都',from: '都道府県'
        fill_in 'facility_address',with: '昭島市'
        fill_in 'facility_types' ,with: '屋内'
        click_button '登録する'
        visit facilities_path
        expect(page).to have_content '喫茶ロード'
        expect(page).to have_content 'テスト1'
        expect(page).to have_content '東京都'
        expect(page).to have_content '昭島市'
        expect(page).to have_content '屋内'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に移行した場合' do
      it '作成済みの施設一覧が表示される' do
        expect(page).to have_content '喫茶ロード'
      end
    end
    context '施設投稿作成日時の降順に並んでいる場合'do
      it '新しい施設が一番上に表示される' do
        facility_list = all('.facility_low')
        expect(facility_list[0]).to have_content 'タイトル4'
      end
    end
  end
  describe'詳細表示機能' do
    context '任意の施設詳細画面に移行した場合' do
      it '該当のタスク内容が表示される' do
        click_on "詳細へ", match: :first
        expect(page).to have_content 'タイトル4'
      end
    end
  end

  context '施設を入力しなかった場合' do
   it '画面遷移されずエラー文が表示される' do
     click_link '新規投稿'
     click_button 'commit'
     expect(page).to have_content '4件のエラーがあります。'
   end
 end
  describe'お気に入り登録機能' do
    context 'お気に入り登録した場合' do
      it '投稿一覧画面にお気に入り登録しましたと表示される' do
        visit facilities_path
        click_on "詳細へ",match: :first
        click_on "お気に入りする"
        expect(page).to have_content 'お気に入り登録しました'
      end
    end
    context 'お気に入りを解除した場合' do
      it '投稿一覧画面にお気に入り解除しましたと表示される' do
        visit facilities_path
        click_on "詳細へ",match: :first
        click_on "お気に入りする"
        click_on "詳細へ",match: :first
        click_on "お気に入り解除する"
        expect(page).to have_content 'お気に入り解除しました'
      end
    end
  end
  describe '検索機能' do
    context "施設名で検索した場合" do
      it "検索キーワードを含む施設で絞り込まれる" do
        fill_in "施設名を入力" ,with: "喫茶ロード"
        click_on "commit"
        expect(page).to have_content'喫茶ロード'
      end
    end
    context "都道府県で検索した場合" do
      it "検索キーワードを含む都道府県で絞り込まれる" do
        fill_in "都道府県を入力" ,with: "東京"
        click_on "commit"
        expect(page).to have_content'喫茶ロード'
        expect(page).to have_content'タイトル4'
      end
    end
    context "都道府県で検索した場合" do
      it "検索キーワードを含む住所で絞り込まれる" do
        fill_in "住所を入力" ,with: "昭島"
        click_on "commit"
        expect(page).to have_content'喫茶ロード'
        expect(page).to have_content'タイトル4'
      end
    end
  end
  describe '投稿編集機能' do
    context '自分の投稿を編集した場合' do
      it '該当の投稿が編集される' do
        click_on '編集へ'
        fill_in "facility[title]",with: "test"
        fill_in "facility[content]",with: "test"
        fill_in "facility[types]",with: "test"
        select '神奈川県',from: '都道府県'
        fill_in "facility[address]",with: "test"
        click_on "commit"
        expect(page).to have_content'test'
      end
    end
  end
end
