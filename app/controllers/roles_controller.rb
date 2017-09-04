class RolesController < ApplicationController
  before_action :set_roles, only: [:show, :update, :destroy]

  def index
    @roles = Role.all
    json_response(@roles)
  end

  def show
    json_response(@role)
  end

  def create
    @role = Role.create!(item_params)
    json_response(@role, :created)
  end

  def update
    @role.update(item_params)
  end

  def destroy
    @role.destroy
  end

  private

  def set_roles
    print params[:id]
    @role = Role.find(params[:id])
  end

  def item_params
    params.permit(:title)
  end

end
