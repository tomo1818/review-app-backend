class Api::V1::TagsController < ApplicationController
  def index
    if params[:group_id]
      render json: Tag.where(group_id: params[:group_id])
    else
      render json: Tag.all
    end
  end

  def show
    render json: Tag.find(params[:id]).to_json()
  end

  def create
    tag = Tag.new(tag_params)
    if tag.save
      render json: tag
    else
      render json: tag.error, status: 422
    end
  end

  private
    def group_params
      params.require(:tag).permit(:name, :group_id)
    end
end