class RoomsController < ApplicationController
  bedore_action :authenticate_user!
  before_action :find_room, only: [:show, :edit, :update, :destroy]
  
  def index
    @room = Room.all
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
    if @room.save
      redirect_to root_path, notice: "Succeed!"
    else
      render :new
    end
  end
  
  def update
    if @room.update
      redirect_to root_path, notice: "Updated!"
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
    params.require(:room).permit(
      :name, :room_introduction, :fee, :address, :image, :crerated_date
    )
  end

  def find_room
    @room = Room.find(params[:id])
  end
end