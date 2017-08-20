class Api::V1::ReactionsController < ApplicationController
  before_action, only: [:show, :update, :destroy]

  def index
    @reactions = Reaction.all
    render json: @reactions
  end


  def create
    @reaction = Reaction.new(reaction_params)
    if @reaction.save
      render json: @reaction
    else
      render json: {status: "error", code: 400, message: @reaction.errors.full_messages[0]}
    end
  end

  def show
    render json: @reaction
  end

  def update
    @reaction.update(reaction_params)
    render json: @reaction
  end

  def destroy
    @reaction.destroy
    render json: Reaction.all
  end


  private

  def set_instance
    @reaction = Reaction.find(params[:id])
  end

  def reaction_params
    params.require(:reaction).permit(:point_1, :point_2, :point_3, :content, :article_id, :user_id)
  end

end
