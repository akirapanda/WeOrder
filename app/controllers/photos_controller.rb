class PhotosController < ApplicationController
  before_action :set_photo, only: [:destroy]
  
  
  def index
  end
  
  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to photo_good_path(@photo.good_id), notice: 'Good was successfully created.' }
        format.json { render action: 'show', status: :created, location: @good }
      else
        format.html { render action: 'new' }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    goods_id=@photo.good_id
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photo_good_path(goods_id) }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:image, :good_id)
    end
end
