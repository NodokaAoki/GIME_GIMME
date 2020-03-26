class Contact < ApplicationRecord
  enum status:{
    "未対応": 0,
    "対応中": 1,
    "保留中": 2,
    "対応済み": 3
  }

  validates :contact_text, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true

end
