class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @users = User.all
    render json: @users
  end

  def create
  @user = User.new(user_params)
      if @user.save
        render json: @user
      else
        render json: {status: "User was not created :,,(", code: 400, message: @user.errors.full_messages[0]}
      end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
  end

  def show
    @user = User.find(params[:id])
    cards = @user.cards
    render json: {user: @user, cards: cards}
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :password, :avatar)
    end

end
