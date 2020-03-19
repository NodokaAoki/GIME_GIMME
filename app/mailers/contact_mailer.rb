class ContactMailer < ApplicationMailer

  def admin_reply(contact)
    @contact = contact
    mail to: contact.email, subject: '【GIME GIMME】お問い合わせありがとうございます'
  end

  def warning_mail(warning)
    @member = warning.member
    @warning = warning
    mail to: @member.email, subject: '【警告】GIME GIMMEのご利用について'
  end
end
