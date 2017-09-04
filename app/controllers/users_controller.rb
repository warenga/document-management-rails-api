class UsersController < ApplicationController
  before_action :set_users, only: [:show, :update, :destroy]

  def index
    @users = User.all
    json_response(@users)
  end

  def show
    json_response(@user)
  end

  def create
    @user = User.create!(item_params)
    json_response(@user, :created)
  end

  def update
    @user.update(item_params)
  end

  def destroy
    @user.destroy
  end

  private

  def set_users
    @user = User.find(params[:id])
  end

  def item_params
    params.permit(:username, :email, :password, :role_id)
  end

end
