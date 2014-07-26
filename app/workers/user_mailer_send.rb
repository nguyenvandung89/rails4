class UserMailerSend
  include Sidekiq::Worker

  def perform car_id
    User.all.each do |user|
      UserMailer.user_contact_email(user).deliver
    end
  end
end