class Admin::ContactsController < AdminController
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
    params.require(:contact).permit(:name, :email, :contact_text, :answer)
  end
end
