##
# mailer controllers for user
# generated manually
class UserMailer < ActionMailer::Base
  default from: "s.s.mahroughi@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, :subject => "Password Reset"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_confirmation.subject
  #
  def account_confirmation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
