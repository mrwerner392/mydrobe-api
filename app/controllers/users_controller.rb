class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    username = params[:username]
    password = params[:password]

    user = User.create(username: username, password: password)
    if user.valid?
      render json: application_json(user)
    else
      render json: { message: user.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

end