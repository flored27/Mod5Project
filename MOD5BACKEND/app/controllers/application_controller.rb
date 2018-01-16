class ApplicationController < ActionController::API
  def current_user
    @landlord ||= Landlord.find_by(id: get_user_id)
  end

  def get_user_id #pushes it to current_user
    decoded_token.first['user_id']
  end

  def issue_token(id)
    JWT.encode({user_id: id}, 'word', 'HS256')
  end

  def decoded_token #decodes the token, returns it into get_user_id
    begin
       JWT.decode(request.headers['Authorization'], 'word', 'HS256')
     rescue JWT::DecodeError
      [{}]
     end
  end
end
