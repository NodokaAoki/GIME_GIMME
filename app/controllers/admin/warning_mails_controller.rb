class Admin::WarningMailsController < AdminController
  def new
    @member = Member.find(params[:member_id])
    @warning = WarningMail.new
  end

  def create
    warning = WarningMail.new(warning_mail_params)
    warning.save!
    ContactMailer.warning_mail(warning).deliver
    redirect_to admin_warning_mail_path(warning.id)
  end

  def show
  end

  def warning_mail_params
    params.require(:warning_mail).permit(:member_id,:warning_text)
  end
end
