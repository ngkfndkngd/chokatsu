class UsersController < ApplicationController
  def show
    @user = current_user
    @recipes = Recipe.where(user_id:current_user).order(created_at: :desc).page(params[:page]).per(7)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
   private

    def user_params
        params.require(:user).permit(:name, :email, :introduction, :profile_image)  
    end
end
