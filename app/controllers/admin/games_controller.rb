class Admin::GamesController < AdminController
  def index
    @games = Game.includes(:game_reports).all
                  .page(params[:page]).per(10)
                  .reverse_order
  end

  def show
    @game = Game.find(params[:id])
    @models = GameModel.where(game_id: @game.id)
    @playtimes = @game.playtimes
    @playtime = Playtime.new
    @comments = @game.comments.page(params[:page]).per(5).reverse_order
    @comment = Comment.new
  end

  def edit
    @game = Game.find(params[:id])
    @genres = Genre.where(status: 'true')
  end

  def update
    @game = Game.find(params[:id])
    @game.update!(game_params)
    redirect_to admin_game_path(@game.id)
  end

  private
  def game_params
    params.require(:game).permit(:title,:release,:number_of_people,:text,:complete,:orbit,:multi_ending,:site_url,:status,:genre_id,:cero_rating,playtimes_attributes: [ :time,:member_id])
  end
end
