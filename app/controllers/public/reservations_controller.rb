class Public::ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3)
  end

 def new
    @reservation = Reservation.new
    @reservation.reservation_images.build
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
    @salon_user = SalonUser.find(params[:salon_user_id])
    message = Reservation.check_reservation_day(@day.to_date)
    if !! message
      redirect_to salon_user_reservations_path, flash: {alert: message}
    end
 end

 def create
   @reservation = current_user.reservations.new(reservation_params)
   if @reservation.save
     flash[:success] = "予約が完了しました。"
     redirect_to users_reservations_path
   else
     @reservation.reservation_images.build
     @day = reservation_params[:day]
     @time = reservation_params[:time]
     @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
     @salon_user = SalonUser.find(params[:salon_user_id])
     render :new
   end
 end

 def show
   @reservation = Reservation.find(params[:id])
   @salon_user = SalonUser.find(params[:salon_user_id])
 end

 def destroy
   @reservation = Reservation.find(params[:id])
   if @reservation.destroy
      flash[:success] = "予約を削除しました。"
      redirect_to salon_user_reservations_path
   else
      render :show
   end
 end

 private

 def reservation_params
   params.require(:reservation).permit(:user_id, :salon_user_id, :dog_breed, :dog_name, :dog_gender, :dog_birth, :day, :time, :menu, :request, :start_time, reservation_images_images: [])
 end

end
