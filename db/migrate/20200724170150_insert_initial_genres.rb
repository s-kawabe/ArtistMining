class InsertInitialGenres < ActiveRecord::Migration[5.2]
  def change
    genres = %w(J-POP 邦楽ロック アイドル アニメ/ゲーム ボーカロイド 洋楽 洋楽ロック R&B/ソウル ヒップホップ K-POP クラシック/ジャズ EDM その他)
    genres.each do |genre|
      Genre.create(genre: genre)
    end
  end
end
