class ReservationsController < ApplicationController
  before_action :find_reservation, only: [:show, :edit, :update, :destroy]
  
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @reservation = Reservation.new
    @room = Room.find(params[:room_id])
    @reservation.room = @room
  end

  def edit
  end

  def show
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to reservations_path, notice: "Succeeded!"
    else
      render :edit
    end
  end
  
  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path, notice: "Updated!"
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
    params.permit(:start_date, :end_date, :people, :room_id)
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end