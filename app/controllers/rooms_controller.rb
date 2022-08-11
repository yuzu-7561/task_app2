class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @user_id = current_user.id
    @user_image = @room.user.image
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(rooms_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "ルームを登録しました。"
      redirect_to room_path(@room)
    else
      render "new"
    end
  end

  def search
    if params[:keyword] == '' || nil
      @searchs = Room.all
    else
      @searchs = Room.where('name LIKE ? OR introduction LIKE ? OR address LIKE ?','%'+params[:keyword]+'%','%'+params[:keyword]+'%','%'+params[:keyword]+'%' )
    end
  end

  private

  def rooms_params
    params.require(:room).permit(
      :name, :introduction, :price, :address, :image, :user_id
    )
  end
end
