class Admin::MenusController < ApplicationController
  def index
    @menus = current_salon_user.menus
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.salon_user_id = current_salon_user.id
    if @menu.save
      redirect_to admin_menus_path, notice: 'メニューの登録が完了しました。'
    else
      @menus = current_salon_user.menus
      render :index
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to admin_menus_path, notice: 'メニューの更新が完了しました。'
    else
      render :edit
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to admin_menus_path, notice: 'メニューの削除が完了しました。'
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :caption, :amount)
  end

end
