class LandlordMailer < ApplicationMailer
  default from: 'PropertyAssistant2018@gmail.com'

  def welcome_email(user)
    @user = user
    @specialtext = `Hello #{@user}, welcome to Property Assistant!`
    mail(to: `#{@user.message_email}`, subject: 'Welcome to Property Assistant 2018')
  end

  def message_tenant(message, email, landlord)
    @user = landlord
    @tenant = email
    @specialtext = message
    mail(to: @tenant, subject: 'Message from Landlord')
  end
end
