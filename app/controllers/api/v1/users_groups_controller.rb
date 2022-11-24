class Api::V1::UsersGroupsController < ApplicationController
  def create
    user = UserGroup.find_by(user_id: params[:user_id], group_id: params[:group_id])
    if !user.nil?
      render json: '既にグループに所属しています'
    end
    user_group = UserGroup.new(users_groups_params)
    if user_group.save
      render json: Group.find(params[:group_id]).to_json(include: :users)
    else
      render json: user_group.erros, status: 422
    end
  end

  def destroy
    user_group = UserGroup.find(params[:id])
    user_group.destroy
    render json: Group.find(user_group.group_id).to_json(include: :users)
  end

  def users_groups_params
    params.require(:users_group).permit(:group_id, :user_id)
  end
end