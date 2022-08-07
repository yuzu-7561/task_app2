class UsersController < ApplicationController
    before_action :set_user, only: [:profile, :update, :account]

    def account
        @email = @user.email
    end

    def profile
    end

    def update
        if @user.update(params.require(:user).permit(:name, :introduction, :image))
            flash[:notice] = "プロフィールを更新しました。"
            redirect_to users_profile_path
        else
            render "profile"
        end
    end 

    private

    def set_user
        @user = current_user
    end
end
