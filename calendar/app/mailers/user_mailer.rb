class UserMailer < ActionMailer::Base
  default :from => 'camelot729@gmail.com'
  def registration_confirmation(user)
    @user = user
    @url = "http://localhost:3000/users/sign_up"
    mail(:to => user.email, :subject => "Registered")

  end
end