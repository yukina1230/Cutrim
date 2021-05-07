class Public::HomesController < ApplicationController
  def top
    @post_images = PostImage.all.order(id: "DESC")
  end

  def about
  end
end
