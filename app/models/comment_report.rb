class CommentReport < ApplicationRecord
  belongs_to :comment

  enum reason:{
    "その他の理由": 0,
    "コメントの情報に間違いがあります": 1,
    "コメントに不適切な表現があります": 2,
    "このコメントは特定の人・物を批判しています": 3,
  }
  enum status:{
    "未対応": 0,
    "対応中": 1,
    "保留中": 2,
    "対応済み": 3
  }

  validates :report, presence: true
  validates :reason, presence: true

end
