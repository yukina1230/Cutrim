class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
    @salon_user = SalonUser.find_by(params[:salon_name])
  end

  def show
    @post = Post.find(params[:id])
    @salon_user = SalonUser.find_by(params[:salon_name])
  end
end
