class Admin::SalonUsersController < ApplicationController
  before_action :authenticate_salon_user!

  def show
    @salon_user = current_salon_user
  end

  def edit
    @salon_user = current_salon_user
  end

  def update
    @salon_user = current_salon_user
    if @salon_user.update(salon_user_params)
      redirect_to admin_salon_users_mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  private

  def salon_user_params
    params.require(:salon_user).permit(
      :salon_name,
      :salon_image,
      :postal_code,
      :prefecture_code,
      :address_city,
      :address_building,
      :phone,
      :email,
      :introduction,
      :business_day,
      :business_start_time,
      :business_end_time)
  end

end
