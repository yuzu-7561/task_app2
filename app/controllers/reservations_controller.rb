class ReservationsController < ApplicationController
  before_action :set_room, only: [:new, :create]
  before_action :set_reservation, only: [:new, :create]
  before_action :check_present, only: [:new]

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    @room_name = @room.name
  end

  def new
    @user_image = @reservation.room.user.image
    @user_id = current_user.id
    @total_days = (@reservation.end_date - @reservation.start_date).to_i
    @total_price = @room.price * @reservation.num_people * @total_days
    render "rooms/show" if @reservation.invalid?
  end

  def create
    if @reservation.save
      flash[:notice] = "予約を確定しました。"
      redirect_to reservation_path(@reservation)
    else
      render "new"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :start_date, :end_date, :num_people, :total_price, :user_id, :room_id
    )
  end

  def set_reservation
    @reservation = Reservation.new(reservation_params)
  end

  def set_room
    @room = Room.find(params[:reservation][:room_id])
  end

  def check_present
    if !(@reservation.start_date?) || !(@reservation.end_date?) || !(@reservation.num_people?)
      redirect_to room_path(@reservation.room_id)
      flash[:notice] = "必須項目を入力してください"
      end
  end

end
