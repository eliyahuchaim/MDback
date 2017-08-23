class Api::V1::ReactionsController < ApplicationController
  before_action :set_instance, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:update]

  def index
    @reactions = Reaction.all
    render json: @reactions
  end


  def create
    par = reaction_params
    par["user_id"] = current_user.id
    @reaction = Reaction.new(par)
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
    if params["reaction"]["initial_score"] === "true"
      @reaction.increment!(:initial_score, 1)
    else
      @reaction.update(reaction_params)
    end
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
    params.require(:reaction).permit(:point_1, :point_2, :point_3, :content, :article_id, :user_id, :initial_score, :final_score)
  end

end
