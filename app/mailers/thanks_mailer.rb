class ThanksMailer < ApplicationMailer


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.send_when_signup.subject
  #
  def send_thanksmail_salonuser(email, salon_name)
    @salon_name = salon_name
    mail to: email, subject: 'Cutrimへの登録をありがとうございます！'
  end
end
