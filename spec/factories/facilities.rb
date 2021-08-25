# 「FactoryBotを使用します」という記述
FactoryBot.define do
  factory :facility do
    title { '喫茶ロード' }
    content { 'テスト1' }
    prefecture{ '東京都' }
    address{ '昭島市'}
    types{'屋内'}
    association:user
  end
# （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :facility2, class: Facility do
    title { 'タイトル２' }
    content { 'コンテント２' }
    prefecture{'埼玉県'}
    address{ '朝霞市' }
    types{'屋外'}
    association:user,factory: :user2
  end
  factory :facility3, class: Facility do
    title { 'タイトル3' }
    content { 'コンテント3' }
    prefecture{'神奈川県'}
    address{ '相模原' }
    association:user,factory: :user3
  end
  factory :facility4, class: Facility do
    title { 'タイトル4' }
    content { 'コンテント4' }
    prefecture{'東京都'}
    address{ '昭島市' }
    association:user,factory: :user4
  end
end
