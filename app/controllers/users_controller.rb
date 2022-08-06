class UsersController < ApplicationController
    def show
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :introduction, :image))
      flash[:notice] = "プロフィールを更新しました。"
      redirect_to controller: :home, action: :top
    else
      render "edit"
    end
    end 

    def users_params
        params.require(:user).permit(
          :name, :image
        )
      end
end
