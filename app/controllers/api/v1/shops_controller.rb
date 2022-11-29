class Api::V1::ShopsController < ApplicationController

  def show
    render json: Shop.where(category_id: params[:id]).to_json(include: [:tags, :category, :reviews, :photos])
  end

  def get_shop
    avg_score = Review.where(shop_id: params[:shop_id]).average(:score)
    render json: { shop: Shop.find(params[:shop_id]).as_json(include: [:tags, :reviews, :category]) , avg_score: avg_score}, status: 200
  end

  def get_all_shops
    render json: Shop.where(group_id: params[:shop_id]).to_json(include: [:tags, :category, :reviews])
  end

  def get_tags
    render json: ShopTag.where(shop_id: params[:shop_id]).to_json()
  end

  def create
    shop = Shop.create(shop_params)
    tags = params[:tag_string].to_s.split(',')
    if shop.save
      # タグを追加
      if tags[0] != ''
        for tag in tags do
          # タグが既成か否か
          if Tag.where(group_id: shop.group_id).exists?(name: tag)
            curr_tag = Tag.find_by(name: tag)
            shop.tags << curr_tag
          else
            new_tag = Tag.new(name: tag.to_s, group_id: shop.group_id)
            if new_tag.save
              shop.tags << new_tag
            end
          end
        end
      end
      render json: shop.to_json(include: [:tags, :category, :reviews])
    else
      render json: shop.erros, status: 422
    end
  end

  def update
    shop = Shop.find(params[:id])
    tags = params[:tag_string].to_s.split(',')
    curr_shop_tags = ShopTag.where(shop_id: params[:id])
    # タグの削除
    if curr_shop_tags.length > 0
      for shop_tag in curr_shop_tags do
        tag = Tag.where(group_id: shop.group_id).find(shop_tag.tag_id)
        if !tags.include?(tag.name)
          shop_tag.destroy
        end
      end
    end
    # タグの追加
    if tags.length > 0
      for tag in tags do
        if Tag.where(group_id: shop.group_id).exists?(name: tag)
          # 1 今現在持っているタグの中にparams内のtagが存在しているか
          flag = false
          for shop_tag in curr_shop_tags do
            curr_tag = Tag.where(group_id: shop.group_id).find(shop_tag.tag_id)
            if curr_tag.name == tag
              flag = true
            end
          end
          # 1-1 存在する→何もしない
          # 1-2 存在しない→タグを追加
          if !flag
            add_tag = Tag.where(group_id: shop.group_id).find_by(name: tag)
            shop.tags << add_tag
          end
        else
          new_tag = Tag.new(name: tag.to_s, group_id: shop.group_id)
          if new_tag.save
            shop.tags << new_tag
          end
        end
      end
    end
    if shop.update(shop_params)
      render json: shop.to_json(include: [:tags, :category, :reviews])
    else
      render json: shop.errors, status: 422
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    render json: shop.to_json()
  end

  private

    def shop_params
      params.require(:shop).permit(:name, :group_id, :category_id, :avg_score, :done, :visit_day, :tag_string, :url, :description, :latitude, :longitude, :amount_of_money, :address)
    end
end
