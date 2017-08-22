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
    @articles = []
    articles_params.each do |article_params|
      if @article = Article.find_or_create_by(article_params)
        @post = Post.find_or_create_by(article_id: @article.id, user_id: current_user.id)
        @articles << @article
      end
    end #articles_params each
    byebug
    if @articles.length > 0
      render json: @articles
    else
      render json: {message: "you crazy"}
    end

    # if @article = Article.find_or_create_by(article_params)
    #   render json: @article
    # else
    #   render json: {status: "error", code: 400, message: @article.errors.full_messages[0]}
    # end #if article found
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
    def articles_params
      params.require(:articles).each{ |article| article.permit! }
    end

    def set_instance
      @article = Article.find(params[:id])
    end


end
