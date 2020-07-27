class InsertInitialFeelings < ActiveRecord::Migration[5.2]
  def change
    feelings = %w(激しい 楽しい 盛り上がれる 可愛い かっこいい  面白い 切ない 落ち付く 熱い 疾走感 希望 不思議 ユニーク 中毒性)
    feelings.each do |feeling|
      Feeling.create(feeling: feeling)
    end
  end
end
