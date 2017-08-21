class Api::V1::ArticlesController < ApplicationController
  skip_before_action :authorized, only: [:index, :article_reactions, :show]
  before_action :set_instance, only: [:show, :destroy, :update]


  def index
    @articles = Article.all
    render json: @articles
  end

  def article_reactions
    # byebug
    @article = Article.find(params[:id])
    @reactions = @article.reactions
    render json: {article: @article, reactions: @reactions}
  end

  def create
    if @article = Article.find_or_create_by(article_params)
        render json: @article
      else
        render json: {status: "error", code: 400, message: @article.errors.full_messages[0]}
      end
  end

  def show
    render json: @article
  end

  def destroy
    @article.destroy
    render json: Article.all
  end

  def update
    @article.update(article_params)
    render json: @article
  end


  private
    def article_params
      params.require(:article).permit(:title, :content, :image)
    end

    def set_instance
      @article = Article.find(params[:id])
    end


end
