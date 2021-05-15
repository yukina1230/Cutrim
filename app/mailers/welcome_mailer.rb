class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.send_when_signup.subject
  #
  def send_when_signup (email, first_name, family_name)
    @first_name = first_name
    @family_name = family_name
    mail to: email, subject: 'Cutrimへの登録をありがとうございます！'
  end
end
