class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @games = Game.where(member_id: @member.id).reverse_order
  end

  def delete_me
    @member = Member.find(params[:id])
  end

  def withdraw
    @member = Member.find(params[:id])
    @member.status = 1
    @member.save
    sign_out
    redirect_to root_path
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path(@member.id)
  end

  private
  def member_params
    params.require(:member).permit(:name, :status, :email)
  end

end
