class API::v1::ArticlesController < ApplicationController

  before_action :set_instance, only: [:show, :destroy, :update]

  def index
    @articles = Article.all
    render json: @articles
  end


  def create
    @article = Article.new(article_params)
      if @article.save
        render json: @article
      else
        render json: {status: "error", code: 400, message: @article.errors.full_messages[0]}
  end

  def show
    render json: @article
  end

  def destroy
    @article.destroy
    redirect_to index
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
