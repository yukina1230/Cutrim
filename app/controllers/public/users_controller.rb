class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  def favorites
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_list = Post.find(favorites)
  end

  def reservations
    @salon_user = SalonUser.find_by(params[:id])
    @reservations = current_user.reservations.where("start_time >= ?", DateTime.current).order(day: :desc)
    @visit_historys = current_user.reservations.where("start_time < ?", DateTime.current).where("start_time > ?", DateTime.current << 12).order(day: :desc)
  end

  private

  def user_params
    params.require(:user).permit(
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :nickname,
      :phone,
      :email,
      :postal_code,
      :prefecture_code,
      :address_city,
      :address_building)
  end

end
