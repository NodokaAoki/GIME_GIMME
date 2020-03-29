# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
   before_action :logout_status, only:[:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  def logout_status
    @user = Member.find_by(email: params[:member][:email], status: "退会")
    if @user
      redirect_to new_member_session_path,notice: '退会済みのアカウントです'
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
