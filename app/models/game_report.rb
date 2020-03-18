class GameReport < ApplicationRecord
  belongs_to :game

  enum reason:{
    "その他の理由": 0,
    "記事内のデータに間違いがあります": 1,
    "記事内に不適切な表現があります": 2,
    "この記事は特定の人・物を批判しています": 3,
    "同じゲームの記事が存在しています": 4
  }
  enum status:{
    "未対応": 0,
    "対応中": 1,
    "保留中": 2,
    "対応済み": 3
  }

end
