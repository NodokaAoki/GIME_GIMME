class Admin::GameReportsController < AdminController
  def show
    @report = GameReport.find(params[:id])
    @game = Game.find_by(id: @report.game_id)
    @models = GameModel.where(game_id: @game.id)
  end

  def update
    report = GameReport.find(params[:id])
    report.update!(report_params)
    redirect_to admin_game_report_path(report.id)
  end

  def index
    @reports = GameReport.all.page(params[:page]).per(10).reverse_order
  end

  private
  def report_params
    params.require(:game_report).permit(:status,:correspondence)
  end
end
