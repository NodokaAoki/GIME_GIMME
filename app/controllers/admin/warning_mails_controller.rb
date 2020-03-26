class Admin::WarningMailsController < AdminController
  def index
    @warnings = WarningMail.all.page(params[:page]).per(10).reverse_order
  end

  def new
    @member = Member.find(params[:member_id])
    @warning = WarningMail.new
  end

  def create
    @warning = WarningMail.new(warning_mail_params)
    if @warning.save
    ContactMailer.warning_mail(@warning).deliver
    redirect_to admin_warning_mail_path(@warning.id)
    else
      @member = Member.find_by(id: @warning.member_id)
      render :new
    end
  end

  def show
    @warning = WarningMail.find(params[:id])
  end

  def warning_mail_params
    params.require(:warning_mail).permit(:member_id,:warning_text)
  end
end
