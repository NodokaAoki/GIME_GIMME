class AdminController < ApplicationController
  before_action :authenticate_admin!
	layout 'admin'

	def top
    @game_reports = GameReport.where(status: 0).reverse_order
    @comment_reports = CommentReport.where(status: 0).reverse_order
    @contacts = Contact.where(status: 0).reverse_order
	end
end