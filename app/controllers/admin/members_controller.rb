class Admin::MembersController < AdminController

  def index
    @members = Member.all.page(params[:page]).per(10).reverse_order
  end

  def games
    @member = Member.find(params[:id])
    @games = Game.where(member_id: @member.id).page(params[:page]).per(10).reverse_order
    @game_reports = GameReport.includes(:game).where(games: {member_id: @member.id})
    @comment_reports = CommentReport.includes(:comment).where(comments: {member_id: @member.id})
  end

  def comments
    @member = Member.find(params[:id])
    @comments = Comment.where(member_id: @member.id).page(params[:page]).per(10).reverse_order
    @game_reports = GameReport.includes(:game).where(games: {member_id: @member.id})
    @comment_reports = CommentReport.includes(:comment).where(comments: {member_id: @member.id})
  end

  def game_reports
    @member = Member.find(params[:id])
    @game_reports = GameReport.includes(:game).where(games: {member_id: @member.id})
    @game_reports_data = @game_reports.page(params[:page]).per(10).reverse_order
    @comment_reports = CommentReport.includes(:comment).where(comments: {member_id: @member.id})
  end

  def comment_reports
    @member = Member.find(params[:id])
    @game_reports = GameReport.includes(:game).where(games: {member_id: @member.id})
    @comment_reports = CommentReport.includes(:comment).where(comments: {member_id: @member.id})
    @comment_reports_data = @comment_reports.page(params[:page]).per(10).reverse_order
  end

  def show
    @member = Member.find(params[:id])
    @games = Game.where(member_id: @member.id).page(params[:page]).per(10).reverse_order
    @game_reports = GameReport.includes(:game).where(games: {member_id: @member.id})
    @comment_reports = CommentReport.includes(:comment).where(comments: {member_id: @member.id})
  end

  def edit
   @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_member_path(@member.id)
  end

  private
  def member_params
    params.require(:member).permit(:name, :email, :status, :report_count)
  end
end
