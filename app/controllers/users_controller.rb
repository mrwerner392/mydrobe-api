class UsersController < ApplicationController

  def create
    username = params[:username]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    if password != password_confirmation
      render json: { message: 'Passwords do not match.' }, status: :unprocessable_entity and return
    end

    user = User.create(username: username, password: password)
    if user.valid?
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

end