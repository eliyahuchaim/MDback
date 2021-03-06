class Api::V1::ArticlesController < ApplicationController
  skip_before_action :authorized, only: [:index, :article_reactions, :show, :update]
  before_action :set_instance, only: [:show, :destroy, :update]


  def index
    @articles = Article.all.order(view_count: :desc).limit(10)
    # @articles = Article.all
    render json: @articles.to_json(:include => {:reactions => {:include => {:user => {:only => :name}}}})
  end

  def article_reactions
    @article = Article.find(params[:id])
    @reactions = @article.reactions.to_json(:include => {:user => {:only => :name}})
    render json: @article.to_json(:include => {:reactions => {:include => {:user => {:only => :name}}}})
    # render json: {article: @article, reactions: @reactions}
  end

  def create
    @articles = []
    articles_params.each do |article_params|
      if @article = Article.find_or_create_by(article_params)
        @post = Post.find_or_create_by(article_id: @article.id, user_id: current_user.id)
        @articles << @article
      end
    end #articles_params each
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
    @article.increment!(:view_count, 1)
    @article.save
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
