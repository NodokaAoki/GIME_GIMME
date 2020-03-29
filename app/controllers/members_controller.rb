class MembersController < ApplicationController
  before_action :authenticate_member!, only: [:show,:games,:comments,:favorites,:delete_me,:withdraw, :edit, :update]

  def show
    @member = Member.find(params[:id])
    if @member != current_member
      redirect_to member_path(current_member)
    end
    @games = Game.where(member_id: @member.id).page(params[:page]).per(10).reverse_order
  end

  def games
    @member = Member.find(params[:id])
    if @member != current_member
      redirect_to my_games_path(current_member)
    end
    @games = Game.where(member_id: @member.id).page(params[:page]).per(10).reverse_order
  end

  def comments
    @member = Member.find(params[:id])
    if @member != current_member
      redirect_to my_comments_path(current_member)
    end
    @comments = Comment.where(member_id: @member.id).page(params[:page]).per(10).reverse_order
  end

  def favorites
    @member = Member.find(params[:id])
    if @member != current_member
      redirect_to my_favorites_path(current_member)
    end
    @favorites = Favorite.where(member_id: @member.id).page(params[:page]).per(10).reverse_order
  end

  def delete_me
    @member = Member.find(params[:id])
    if @member != current_member
      redirect_to member_path(current_member)
    end
  end

  def withdraw
    @member = Member.find(params[:id])
    if @member != current_member
      redirect_to member_path(current_member)
    end
    @member.status = 1
    @member.save
    
    sign_out
    redirect_to root_path,notice: '退会しました。'
  end

  def edit
    @member = Member.find(params[:id])
    if @member != current_member
      redirect_to edit_member_path(current_member)
    end
  end

  def update
    @member = Member.find(params[:id])
    if @member != current_member
      redirect_to member_path(current_member)
    end
    @member.update(member_params)
    redirect_to member_path(@member.id)
  end

  private
  def member_params
    params.require(:member).permit(:name, :status, :email)
  end

end
