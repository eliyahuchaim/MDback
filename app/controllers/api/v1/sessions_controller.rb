class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      payload = {user_id: @user.id}
      token = issue_token(payload)
      render json: {not_jwt: token, user_id: @user.id}
    else
      render json: {message: "You fucked up boi"}
    end
  end

  # def destroy
  #
  # end

end
