class Api::V1::PostsController < ApplicationController


  def index
    render json: Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: {status: "error", code: 400, message: @post.errors.full_messages[0]}
    end
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update
    render json: @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: @post
  end


  private

  def post_params
    params.require(:post).permt(:article_id, :user_id)
  end
end
