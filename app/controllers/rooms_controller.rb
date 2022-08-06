class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @user_image = current_user.image
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

  def rooms_params
    params.require(:room).permit(
      :name, :introduction, :price, :address, :image, :user_id
    )
  end
end
