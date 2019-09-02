class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def activation_email(user)
    @user = user
    mail(to: user.email, subject: "Thanks for signing up to Music.fm! Please follow the instructions to activate your account!")
  end
end
