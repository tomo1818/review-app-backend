class Api::V1::ReviewsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:create, :update, :destroy]

  def show
    render json: Review.where(shop_id: params[:id]).to_json()
  end

  def get_review
    render json: Review.find(params[:review_id]).to_json()
  end

  def create
    review = Review.new(review_params)
    if review.save
      render json: review.to_json()
    else
      render json: review.errors, status: 422
    end
  end

  def update
    review = Review.new(params[:id])

    if current_api_v1_user.id == review.user_id
      ActiveRecord::Base.transaction do
        if review.update(review_params)
          render json: review.to_json()
        else
          render json: review.errors, status: 422
        end
      end
    else
      render json: { message: 'can not update data'}, status: 422
    end
  end

  def destroy
    review = Review.new(params[:id])
    if current_api_v1_user.id == review.user_id
      review.destroy
      render json: review.to_json()
    else
      render json: { message: 'can not delete data' }, status: 422
    end
  end

  private

    def review_params
      params.require(:review).permit(:shop_id, :comment, :score, :title).merge(user_id: current_api_v1_user.id, author: current_api_v1_user.name)
    end
end
