class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@work = Work.find(params[:work_id])
		@comment = @work.comments.build(comment_params)
		# @comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			# redirect_to work_path(@comment.work)
			redirect_back(fallback_location: root_path)
		else
			# redirect_to new_user_session_path
			redirect_back(fallback_location: root_path)
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:content,:user_id,:work_id)
	end
end
