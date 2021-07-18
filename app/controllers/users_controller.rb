class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_profile, only: [:show, :edit, :update]
  
  def index
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
    @user = User.find(params[:id])
  end
  
  private
  
  def profile_params
    params.require(:user).permit(:name, :profile)
  end
end