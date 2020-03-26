class WarningMail < ApplicationRecord
  belongs_to :member
  validates :warning_text, presence: true
end
