class Admin::ContactsController < AdminController
  def index
    @contacts = Contact.all.page(params[:page]).per(10).reverse_order
  end

  def status_update
    contact = Contact.find(params[:id])
    contact.status = params[:status]
    contact.save!
    redirect_to edit_admin_contact_path(contact.id)
  end

  def update
    contact = Contact.find(params[:id])
    contact.update(contact_params)
    ContactMailer.admin_reply(contact).deliver
    redirect_to edit_admin_contact_path
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :contact_text, :answer,:status)
  end
end
