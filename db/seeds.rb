# Prefecture.destroy_all
# City.destroy_all

# %w[北海道 青森 岩手 宮城 秋田 山形 福島 茨城 栃木 群馬 埼玉 千葉 東京 神奈川
#   新潟 富山 石川 福井 山梨 長野 岐阜 静岡 愛知 三重 滋賀 京都 大阪 兵庫 奈良
#   和歌山 鳥取 島根 岡山 広島 山口 徳島 香川 愛媛 高知 福岡 佐賀 長崎 熊本 大分 宮崎 鹿児島 沖縄
# ].each do |name|
#   Prefecture.create!(
#     name: name,
#   )
# end

# %w[].each do |name|
#   City.create!(
#     name: name,
#   )
# end

City.destroy_all
Prefecture.destroy_all
OndemandCategory.destroy_all


require 'csv'

# CSV読み込み
file_path = 'lib/prefecture.csv'
csv_data = CSV.read(file_path)

# 都道府県データ抽出
prefectures_list = csv_data.map { |row| row[1] }.uniq

# 市区町村データ抽出
cities_list = csv_data.map do |row|
    next if row[2] == nil
    row[1, 2]
  end.compact

# 都道府県データ作成
prefectures_list.each do |prefecture|
  Prefecture.create!(name: prefecture)
end

# 市区町村データ作成
cities_list.each do |prefecture, city|
  prefecture = Prefecture.find_by(name: prefecture)
  prefecture.cities.create(name: city)
end

# %w[ネット].each do |name|
#   OndemandCategory.create!(
#     name: name,
#     parent_id: "",
#   )
# end

%w[スポーツ 音楽 ゲーム ボードゲーム アウトドア 交流].each do |name|
  OndemandCategory.create!(
    name: name,
    parent_id: "",
  )
end

%w[野球 ソフトボール サッカー フットサル バスケ バレー バトミントン ハンドボール 卓球 ドッジボール ゲートボール ボウリング
  ビリヤード ランニング・マラソン 水泳 フィットネス ヨガ 体操 サイクリング ダーツ テニス ゴルフ バスケット ラグビー アメフト 格闘技
  ボクシング キックボクシング 柔道/柔術 ウィンタースポーツ スキー スノーボード フィギュアスケート フィールドホッケー アイスホッケー
  相撲 柔道 剣道 空手 フェンシング ムエタイレスリング 総合格闘技 テコンドー モータースポーツF1 水泳 サーフィン その他スポーツ].each do |name|
  OndemandCategory.create!(
    name: name,
    parent_id: "1",
  )
end

%w[バンド ギター/アコギ ピアノ ボーカル JAZZ カラオケ].each do |name|
  OndemandCategory.create!(
    name: name,
    parent_id: "2",
  )
end

%w[ボードゲーム 囲碁 将棋 チェス 麻雀 その他].each do |name|
  OndemandCategory.create!(
    name: name,
    parent_id: "4",
  )
end

%w[キャンプ つり 山登り].each do |name|
  OndemandCategory.create!(
    name: name,
    parent_id: "5",
  )
end

%w[グルメ/食べ歩き カフェ巡り 飲み会 ナイトクラブ 自分磨き ダンス].each do |name|
  OndemandCategory.create!(
    name: name,
    parent_id: "6",
  )
end