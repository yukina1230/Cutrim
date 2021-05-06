class Public::ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3)
  end

 def new
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
    #@menu = SalonUser.menus.where(menu_id:)
    message = Reservation.check_reservation_day(@day.to_date)
    if !! message
      redirect_to @reservation, flash: {alert: message}
    end
 end

 def create
   @reservation = Reservation.new(reservation_params)
   if @reservation.save
     redirect_to salon_user_reservation_path(@reservation), flash[:success] = "予約が完了しました。"
   else
     render :new
   end
 end

 def show
   @reservation = Reservation.find(params[:id])
 end

 def destroy
   @reservation = Reservation.find(params[:id])
   if @reservation.destroy
      redirect_to salon_user_reservations_path, flash[:success] = "予約を削除しました。"
   else
      render :show
   end
 end

 private

 def reservation_params
   params.require(:reservation).permit(:user_id, :salon_user_id, :dog_breed, :dog_name, :dog_gender, :dog_birth, :day, :time, :request, :start_time)
 end

end
