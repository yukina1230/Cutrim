class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.order(" created_at DESC ")
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def search
    @search = params[:search]
    @reservations = Reservation.search(params[:search])
  end
end
