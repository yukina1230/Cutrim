class Admin::PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.salon_user_id = current_salon_user.id
    if @post_image.save!
      redirect_to admin_post_images_path, notice: "投稿が完了しました。"
    else
      @post_images = PostImage.all
      render :index
    end
  end

  def index
    @post_images = PostImage.all
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to admin_post_images_path, notice: "更新が完了しました。"
    else
      render :edit
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to admin_post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:post_image, :description, :dog_breed)
  end

end
