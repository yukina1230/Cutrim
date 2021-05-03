class Admin::MenusController < ApplicationController
  def index
    @menus = Menu.all
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.save
    redirect_to admin_menus_path, notice: 'メニューの登録が完了しました。'

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
    redirect_to admin_menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :caption, :amount)
  end

end
