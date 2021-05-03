class Public::SalonUsersController < ApplicationController
  def index
    @salon_users = SalonUser.all
  end

  def show
    @salon_user = SalonUser.find(params[:id])
  end
end
