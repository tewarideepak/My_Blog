class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user_email.subject
  #
  def new_user_email(user)
    @user = user
    # users = User.all
    # users.each do |u|
    #   mail(to: u.email, subject: 'New user signup')
    # end
    mail(to: user.email, subject: 'New user signup')
  end
end
