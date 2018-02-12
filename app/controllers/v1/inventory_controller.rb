class V1::InventoryController < ApplicationController
  before_action :authenticate_user

  def index
    @inventory = Inventory.all.where(:user_id => current_user)
    render json: @inventory
  end

  def show

  end

end