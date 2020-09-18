class GameReportsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @models = GameModel.where(game_id: @game.id)
    @report = GameReport.new
  end

  def create
    @report = GameReport.new(report_params)
    if @report.save
      begin
        @game = Game.find_by!(id: @report.game_id)
        @models = GameModel.where(game_id: @game.id)
        member = Member.find_by!(id: @game.member_id)
        member.report_count = member.report_count + 1
        member.save!
      retry
      end
    else
      @game = Game.find_by(id: @report.game_id)
      @models = GameModel.where(game_id: @game.id)
      render :new
    end
  end

  private
  def report_params
    params.require(:game_report).permit(:reason,:report,:status,:correspondence,:game_id)
  end
end
