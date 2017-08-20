class API::v1::CardsController < ApplicationController

  def index
    render json: Card.all
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      render json: @card
    else
      render json: {status: "error", code: 400, message: @card.errors.full_messages[0]}
  end

  def show
    @card = Card.find(params[:id])
    render json: @card
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)
    render json: @card
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    render json: Card.all
  end




  private

  def card_params
    params.require(:card).permit(:reaction_id)
  end

end
