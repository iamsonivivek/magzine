class CommentsController < ApplicationController
	def create
		@comment = current_user.comments.create(comments_param) if current_user
		respond_to do |format|
			format.js
		end
	end
	
	def destroy
		@comment = Comment.find(params[:id]) 
		@comment.delete
		respond_to do |format|
			format.js
		end
	end


private 
	def comments_param
		params.require(:comment).permit(:body, :article_id, :parent_id)
	end	
end
