class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:content))
		@comment.update_attribute(:user_id,current_user.id)
		redirect_to post_path(@post)
  	end
end
