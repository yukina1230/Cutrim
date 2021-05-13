class Public::PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC").page(params[:page])
    @salon_user = SalonUser.find_by(params[:salon_name])
  end

  def show
    @post = Post.find(params[:id])
    @salon_user = SalonUser.find_by(params[:salon_name])
  end

  def search
    @search = params[:dog_breed]
    @posts = Post.search(params[:dog_breed])
    @salon_user = SalonUser.find_by(params[:salon_name])
  end

end
