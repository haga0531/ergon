class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user,only: [:edit,:update]

    def show
    	@user = User.find(params[:id])
        @works = @user.works
        @likes = Like.where(user_id: @user.id)
        @comments = Comment.where(user_id: @user.id)
    end

    def edit
    	@user = User.find(params[:id])
    end

    def update
    	user = User.find(params[:id])
    	if user.update(user_params)
    		redirect_to user_path(user)
    	else
            @user = User.find(params[:id])
    		render :edit
    	end
    end

    def about_ergon
    end

    def about_auther
    end

    def contact
    end

    private
    def user_params
    	params.require(:user).permit(:name,:email,:image,:introduction)
    end

    def correct_user
        @user = User.find(params[:id])
        unless @user == current_user
            redirect_to user_path(current_user)
        end
    end
end
