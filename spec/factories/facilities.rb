# 「FactoryBotを使用します」という記述
FactoryBot.define do
  factory :facility do
    title { '喫茶ロード' }
    content { 'テスト1' }
    prefecture{ '東京' }
    address{ '昭島市'}
    types{'屋内'}
    association:user
  end
# （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :facility2, class: Facility do
    title { 'タイトル２' }
    content { 'コンテント２' }
    prefecture{'埼玉'}
    address{ '朝霞市' }
    types{'屋外'}
  end
  factory :facility3, class: Facility do
    title { 'タイトル3' }
    content { 'コンテント3' }
    prefecture{'神奈川'}
    address{ '相模原' }
  end
end
