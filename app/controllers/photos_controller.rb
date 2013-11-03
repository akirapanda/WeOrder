class PhotosController < ApplicationController
  before_action :set_photo, only: [:destroy]
  before_filter :authenticate_user!
  
  
  def index
  end
  
  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to photo_product_path(@photo.product_id), notice: t('products.photo_add_success') }
        format.json { render action: 'show', status: :created, location: @good }
      else
        format.html { render action: 'new' }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    product_id=@photo.product_id
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photo_product_path(product_id) }
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
