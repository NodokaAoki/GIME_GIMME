class Admin::CommentReportsController < AdminController
  def show
    @report = CommentReport.find(params[:id])
    @comment = Comment.find_by(id: @report.comment_id)
  end

  def update
    report = CommentReport.find(params[:id])
    report.update!(report_params)
    redirect_to admin_comment_report_path(report.id)
  end

  def index
    @reports = CommentReport.all.reverse_order
  end

  private
  def report_params
    params.require(:comment_report).permit(:status,:correspondence)
  end
end
