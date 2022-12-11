class Api::V1::UsersController < ApplicationController
  def index
    if params[:email] && params[:group_id]
      users = []
      search_users = User.where(email: params[:email])
      search_users.each do |user|
        if UserGroup.find_by(user_id: user.id, group_id: params[:group_id]) == nil
          users.push(user)
        end
      end
      render json: users.to_json()
    elsif params[:word] && params[:group_id]
      users = []
      search_users = User.where("name LIKE ?", "%#{params[:word]}%")
      search_users.each do |user|
        if UserGroup.find_by(user_id: user.id, group_id: params[:group_id]) == nil
          users.push(user)
        end
      end
      render json: users.to_json()
    else
      render json: User.all
    end
  end

  def show
    userGroups = UserGroup.where(user_id: params[:id])
    groups = []
    for userGroup in userGroups do
      group = Group.find(userGroup.group_id)
      groups.push(group.as_json(include: :users))
    end
    render json: groups.to_json()
  end
end
