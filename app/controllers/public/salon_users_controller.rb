class Public::SalonUsersController < ApplicationController
  def index
    @salon_users = SalonUser.all
  end

  def show
    @salon_user = SalonUser.find(params[:id])
  end

  def search
    @search = params[:search]
    @salon_users = SalonUser.search(params[:search])
  end
end
