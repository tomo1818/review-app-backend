class Api::V1::PhotosController < ApplicationController

  def index
    if params[:shop_id]
      render json: Photo.where(shop_id: params[:shop_id])
    else
      render json: Photo.all
    end
  end

  def show
    photo = Photo.find(params[:id])
    render json: photo
  end

  def create
    photo = Photo.new(photo_params)
    if photo.save
      render json: photo
    else
      render json: photo.error, status: 422
    end
  end

  def destroy
    photo = Shop.find(params[:id])
    photo.destroy

    render json: photo
  end

  private
    def photo_params
      params.require(:photo).permit(:image, :shop_id)
    end
end
