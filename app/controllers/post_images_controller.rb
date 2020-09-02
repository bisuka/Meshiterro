class PostImagesController < ApplicationController

# 　画像の投稿画面
  def new
    # http://localhost:3000/post_images/new  空白画面
    @post_image = PostImage.new
  end

# 　投稿画像を保存
  def create
    # http://localhost:3000/post_images
    # 空白画面に投稿データを代入「post_image_params」
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
    redirect_to post_images_path
    else
      # redirect_to new_post_image_pathにすると　def newに飛び空白画面が表示される
      # renderの場合は　http://localhost:3000/post_imagesが直接表示
      render :new
    end
  end

# 　投稿画像のリストを表示
  def index
    @post_images = PostImage.page(params[:page]).reverse_order
  end

# 　投稿画像の詳細表示
  def show
    # 空白画面にidを代入「find(params[:id])」
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

# 投稿データのストロングパラメータ
  private
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
