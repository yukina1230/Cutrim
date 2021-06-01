class Admin::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.salon_user_id = current_salon_user.id
    @post.score = Language.get_data(post_params[:caption])
    if @post.save
      redirect_to admin_posts_path, notice: '投稿が完了しました。'
    else
      render :new
    end
  end

  def index
    @posts = current_salon_user.posts
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: '更新が完了しました。'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: '削除が完了しました。'
  end

  private

  def post_params
    params.require(:post).permit(:dog_breed, :caption,  post_images_images: [])
  end

end
