class LikesController < ApplicationController
  def create
    @work = Work.find(params[:work_id])
    @like = Like.create(user_id: current_user.id, work_id: params[:work_id])
    @work.reload
  end

  def destroy
    @work = Work.find(params[:work_id])
    @like = Like.find_by(user_id: current_user.id, work_id: params[:work_id])
    @like.destroy
    @work.reload
  end
end
