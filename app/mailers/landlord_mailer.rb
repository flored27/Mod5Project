class LandlordMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @specialtext = `Hello #{@user}, welcome to Property Assistant!`
    mail(to: `#{@user.message_email}`, subject: 'Welcome to Property Assistant 2018')
  end

  def message_tenant(user)
    @user = user
    @specialtext = @user.message
    mail(to: @user.message_email, subject: 'Message from Landlord')
  end
end
