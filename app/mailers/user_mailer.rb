class UserMailer < ActionMailer::Base
  default from: "ngvandung2010@gmail.com"

  def user_contact_email user
    mail = user.email
    mail(from: "ngvandung2010@gmail.com",
      to: mail, subject: "tao moi 1 xe")
  end
end
