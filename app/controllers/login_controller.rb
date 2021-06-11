class LoginController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    username = params[:username]
    password = params[:password]

    user = User.find_by(username: username)
    if user && user.authenticate(password)
      render authentication_json(user.id)
    else
      render json: {message: ["Invalid username or password."]}, status: :unprocessable_entity
    end
  end

end
