class CommentReportsController < ApplicationController
  def new
    @comment = Comment.find(params[:comment_id])
    @report = CommentReport.new
  end

  def create
    @report = CommentReport.new(report_params)
    if @report.save
      begin
        @comment = Comment.find_by!(id: @report.comment_id)
        member = Member.find_by!(id: @comment.member_id)
        member.report_count = member.report_count + 1
        member.save!
      retry
      end
    else
      @comment = Comment.find_by(id: @report.comment_id)
      render :new
    end
  end

  private
  def report_params
    params.require(:comment_report).permit(:reason,:report,:status,:correspondence,:comment_id)
  end

end
