class LandlordMailer < ApplicationMailer
  default from: 'propertyassistant2018@gmail.com'

  def welcome_email(user)

    @user = user
    @specialtext = `Hello #{user}, welcome to Property Assistant!`
    @url  = 'http://gmail.fandm.edu'
    mail(to: 'diego.flores@fandm.edu', subject: 'Welcome to Property Assistant 2018')
  end

  def message_tenant(user)
    @user = user
    @specialtext = @user.message
    mail(to: @user.message_email, subject: 'Message from Landlord')
  end
end
