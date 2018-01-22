class LikesController < ApplicationController
  before_action :logged_in_user
  before_action :load_post

  def create
    @like = current_user.likes.new like_params

    if @like.save
      respond_to do |format|
        format.html do
          flash[:success] = "Liked"
          redirect_to @post
        end
        format.js
        format.json
      end
    else
      respond_to do |format|
        format.html do
          flash[:danger] = "Not success"
          redirect_to @post 
        end
        format.js
        format.json
      end
    end
  end

  def destroy
    if @like.destroy
      respond_to do |format|
        format.html do
          flash[:success] = "UnLiked"
          redirect_to @post
        end
        format.js
        format.json
      end
    else
      respond_to do |format|
        format.html do
          flash[:danger] = "UnLiked not success"
          redirect_to @post
        end
        format.js
        format.json
      end
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end

  def load_post
    @post = Post.find_by id: params[:post_id]
    redirect_to root_path unless @post  
  end
end