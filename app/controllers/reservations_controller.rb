class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @reservation.user_id = current_user.id
    @room = Room.find(params[:room_id])
    @reservation.room_id = @room.id
    @reservation.room = @room
    @reservation.days = (@reservation.end_date - @reservation.start_date).to_i
    @reservation.total = @room.fee * @reservation.people * @reservation.days
  end
  
  def edit
  end

  def show
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @reservation.user_id = current_user.id
    @room = Room.find(params[:room_id])
    @reservation.room_id = @room.id
    @reservation.room = @room
    @reservation.days = (@reservation.end_date - @reservation.start_date).to_i
    @reservation.total = @room.fee * @reservation.people * @reservation.days
    if @reservation.save
      redirect_to root_path, notice: "Succeeded!"
    else
      render :edit
    end
  end
  
  def update
    if @reservation.update(reservation_params)
      redirect_to room_reservation_path, notice: "Updated!"
    else
      render :edit
    end
  end
  
  def destroy
    if @reservation.destroy
      redirect_to root_path, notice: "Deleted."
    else
      redirect_to root_path, alert: "Failed..."
    end
  end
  
  private
  
  def reservation_params
    params.permit(:start_date, :end_date, :people, :room_id, :user_id)
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
