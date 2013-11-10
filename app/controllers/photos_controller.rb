class PhotosController < ApplicationController
  before_action :set_photo, only: [:destroy]
  before_filter :authenticate_user!

  def index
  end
  
  
  def weixin
    @photo=Photo.find(params[:id])
    @photo.weixin_cover=! @photo.weixin_cover
    @success=@photo.save
    
  end
  
  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to photo_admin_product_path(@photo.product_id), notice: t('products.photo_add_success') }
      else
        format.html {  redirect_to photo_admin_product_path(@photo.product_id), alert: "上传配图失败，请检查文件格式" }
        format.js
      end
    end
  end
  
  def destroy
    product_id=@photo.product_id
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photo_admin_product_path(product_id) }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image, :product_id)
    end
end
