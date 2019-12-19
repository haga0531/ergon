class WorksController < ApplicationController
	def index
		@works = Work.all.order(created_at: :desc)
		@all_ranks = Work.find(Like.group(:work_id).order('count(work_id) desc').limit(3).pluck(:work_id))
		if params[:tag_name]
			@works = @works.tagged_with("#{params[:tag_name]}")
		end
	end

	def new
		@work = Work.new
	end

	def confirm
		@work = current_user.works.build(work_params)
		render :new if @work.invalid?
	end

	def create
		# @work = Work.new(work_params)
		@work = current_user.works.build(work_params)
		url = params[:work][:youtube_url]
	    url = url.last(11)
	    @work.youtube_url = url
		if params[:back]
	      render :new
	    elsif @work.save
	      redirect_to user_path(@work.user), notice: 'Task was successfully created.'
	    else
	      render :new
	    end
	end

	def show
		@work = Work.find(params[:id])
		@like = Like.find_by(user_id: current_user.id, work_id: params[:id]) if user_signed_in?
		@comment = Comment.new
		@comments = @work.comments
	end

	def edit
		@work = Work.find(params[:id])
	end

	def update
		@work = Work.find(params[:id])
		if @work.update(work_params)
			redirect_to work_path(@work)
		else
			render :edit
		end
	end


	private
	def work_params
		params.require(:work).permit(:title,:description,:app_url,:image,:youtube_url, :tag_list)
	end
end
