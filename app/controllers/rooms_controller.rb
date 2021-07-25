class RoomsController < ApplicationController
  before_action :find_room, only: [:show, :edit, :update, :destroy]
  
  def index
    @rooms = Room.all
  end
  
  def edit
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to rooms_path, notice: "Succeeded!"
    else
      render :new
    end
  end
  
  def update
    @user = current_user
    @room.user_id = current_user.id
    if @room.update!(room_params)
      redirect_to rooms_path, notice: "Updated!"
    else
      render :edit
    end
  end
  
  def destroy
    if @room.destroy
      redirect_to root_path, notice: "Deleted."
    else
      redirect_to root_path, alert: "Failed..."
    end
  end
    
  private
  
  def room_params
    params.require(:room).permit(:name, :room_introduction, :fee, :address, :image, :user_id)
  end

  def find_room
    @room = Room.find(params[:id])
  end
end