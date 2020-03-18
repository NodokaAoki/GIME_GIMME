class CommentReportsController < ApplicationController
  def new
    @comment = Comment.find(params[:comment_id])
    @report = CommentReport.new
  end

  def create
    report = CommentReport.new(report_params)
    report.save!
    comment = Comment.find_by(id: report.comment_id)
    member = Member.find_by(id: comment.member_id)
    member.report_count = member.report_count + 1
    member.save!
    redirect_to comment_report_path(report.id)
  end

  def show
    @report = CommentReport.find(params[:id])
    @comment = Comment.find_by(id: @report.comment_id)
  end

  private
  def report_params
    params.require(:comment_report).permit(:reason,:report,:status,:correspondence,:comment_id)
  end

end
