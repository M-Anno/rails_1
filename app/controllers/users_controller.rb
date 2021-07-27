class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end
  
  def new
  end
  
  def edit
  end

  def create
    @profile = Profile.find(params[:id])
    if @profile.save
    flash[:success] = "Profile updated!"
      render :show
    else
    render action: :new
    end
  end

  def show
    @user = User.find_by_uid!(params[:id])
  end
  
  private
  
  def profile_params
    params.require(:user).permit(:name, :profile)
  end
end
