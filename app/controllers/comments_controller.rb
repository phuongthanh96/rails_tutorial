class CommentsController < ApplicationController
	def create
		@comment =Comment.new comment_params
		 if @comment.save
		 	flash[:success] = "Create comment sucessfully"
		 	redirect_back(fallback_location: root_path)
		 else
		 	flash[:danger] ="Create comment failed"
		 	redirect_back(fallback_location: root_path)
		 end
	end

	private

	def comment_params
		params.require(:comment).permit :user_id,:post_id,:content
	end
end
