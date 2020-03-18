class GameReportsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @models = GameModel.where(game_id: @game.id)
    @report = GameReport.new
  end

  def create
    report = GameReport.new(report_params)
    report.save!
    game = Game.find_by(id: report.game_id)
    member = Member.find_by(id: game.member_id)
    member.report_count = member.report_count + 1
    member.save!
    redirect_to game_report_path(report.id)
  end

  def show
    @report = GameReport.find(params[:id])
    @game = Game.find_by(id: @report.game_id)
    @models = GameModel.where(game_id: @game.id)
  end

  private
  def report_params
    params.require(:game_report).permit(:reason,:report,:status,:correspondence,:game_id)
  end
end
