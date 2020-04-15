class GamesController < ApplicationController
  before_action :authenticate_member!, only: [:new, :edit, :create, :update, :hidden, :delete]

  def index
    @genres = Genre.where(status: 'ture').reverse_order
    if params[:id] == nil
      @games = Game.where(status: true).page(params[:page]).per(10).reverse_order
      @title = "ゲーム"
    else
      @games = Game.where(genre_id: params[:id]).where(status: true).page(params[:page]).per(10).reverse_order
      genre = Genre.find(params[:id])
      @title = genre.name + "ゲーム"
    end
  end

  def new
    @game = Game.new
    @playtime = @game.playtimes.build
    @genres = Genre.where(status: 'true')
  end

  def create
    @game = Game.new(game_params)
    @game.member_id = current_member.id
    if @game.save
      redirect_to game_path(@game.id)
    else
      @genres = Genre.where(status: 'true')
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
    @models = GameModel.where(game_id: @game.id)
    @playtimes = @game.playtimes
    @playtime = Playtime.new
    @comments = @game.comments.page(params[:page]).per(5).reverse_order
    @comment = Comment.new
  end

  def playtime_create
    @playtime = Playtime.new(playtime_params)
    @playtime.game_id = params[:id]
    @playtime.member_id = current_member.id
    if @playtime.save
      redirect_to game_path(@playtime.game_id)
    else
      @game = Game.find(params[:id])
      @models = GameModel.where(game_id: @game.id)
      @playtimes = @game.playtimes
      @comments = @game.comments.page(params[:page]).per(5).reverse_order
      @comment = Comment.new
      render :show
    end
  end

  def edit
    @game = Game.find(params[:id])
    if @game.member != current_member
      redirect_to game_path(@game)
    end
    @genres = Genre.where(status: 'true')
  end

  def update
    @game = Game.find(params[:id])
    if @game.member != current_member
      redirect_to game_path(@game)
    end
    @game.update!(game_params)
    redirect_to game_path(@game.id)
  end

  def hidden
    @game = Game.find(params[:id])
    if @game.member != current_member
      redirect_to game_path(@game)
    end
    if @game.status == true
      @game.status = false
      @game.save!
      redirect_to game_path(@game.id),notice: "記事を非公開にしました。"
    else
      @game.status = true
      @game.save!
      redirect_to game_path(@game.id),notice: "記事を公開にしました。"
    end
  end

  def delete
    @game = Game.find(params[:id])
    if @game.member != current_member
      redirect_to game_path(@game)
    end
    @game.destoy
    redirect_to root_path, notice: "記事を完全に削除しました。"
  end

  private
  def game_params
    params.require(:game).permit(:title,:release,:number_of_people,:text,:complete,:orbit,:multi_ending,:site_url,:status,:genre_id,:cero_rating,model_ids:[],playtimes_attributes: [ :time,:member_id])
  end
  def playtime_params
    params.require(:playtime).permit(:time,:member_id)
  end

end
