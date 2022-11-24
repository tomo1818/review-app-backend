class Api::V1::GroupsController < ApplicationController
  def index
    render json: Group.all
  end

  def show
    render json: Group.find(params[:id])
  end

  def get_group_users
    users = UserGroup.where(group_id: params[:group_id])
    render json: users
  end

  def create
    group = Group.new(group_params)
    group.users << current_api_v1_user
    group.owner_id = current_api_v1_user.id
    if group.save
      render json: group.as_json(include: :users)
    else
      render json: group.erros, status: 422
    end
  end

  def update
    group = Group.find(params[:id])
    if group.update(group_params)
      render json: group.as_json(include: :users)
    else
      render json: group.erros, status: 422
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    render json: group
  end

  def delete_user
    group = Group.find(params[:group_id])
    user = User.find(params[:user_id])
    user_group = UserGroup.find_by(user_id: params[:user_id], group_id: params[:group_id])
    user_group.destroy

    render json: Group.find(params[:group_id]).as_json(include: :users)
  end

  private
    def group_params
      params.require(:group).permit(:name, :owner_id)
    end

  # def ensure_correct_user
  #   @group = Group.find(params[:id])
  #   unless @group.owner_id == current_user.id
  #     redirect_to groups_path
  #   end
  # end
end