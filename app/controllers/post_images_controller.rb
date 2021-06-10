class PostImagesController < ApplicationController
  before_action :authenticate_user!
     def index
        @post_images = PostImage.all
        @post_image = PostImage.new

  end


    def new

  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save!
    redirect_to post_images_path
  end


  def show
             @user = User.find(params[:id])
        @post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def destroy
  end

   private

  def post_image_params
      params.require(:post_image).permit(:shop_name, :caption)

  end

end
