class Public::SalonUsersController < ApplicationController
  def index
    @salon_users = SalonUser.all
  end

  def show
    @salon_user = SalonUser.find(params[:id])
    #@post = Post.where(post_id: @salon_user.post.id)
    #@menus = Menu.pluck(:id, :name, :caption, :amount)
  end
end
