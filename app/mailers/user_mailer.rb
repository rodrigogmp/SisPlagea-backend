class UserMailer < ApplicationMailer

  def recover_password(email, password)
    @password = password
    mail(to: email, subject: 'Nova senha')
  end
end
