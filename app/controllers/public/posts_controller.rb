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
    @search = params[:search]
    @posts = Post.search(params[:search])
    @salon_user = SalonUser.find_by(params[:salon_name])
  end

end
