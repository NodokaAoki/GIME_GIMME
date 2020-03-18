class Comment < ApplicationRecord
	belongs_to :member
	belongs_to :game

  has_many :comment_reports, dependent: :destroy
end
