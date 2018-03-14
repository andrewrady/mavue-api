class V1::InventoryController < ApplicationController
  before_action :authenticate_user

  def index
    @inventory = Inventory.all.where(:user_id => current_user)
    render json: @inventory
  end

  def show
    @inventory = Inventory.where(:user_id => current_user).where(:id => params[:id])
    render json: @inventory
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user_id = current_user.id

    if @inventory.save
      render json: @inventory, status: 201
    else
      render json: { errors: errors.messages }, status: 422
    end
  end

  def update
    @inventory = Inventory.where(:user_id => current_user).where(:id => params[:id])

    if @inventory.update(inventory_params)
      render json: @inventory, status: 201
    else
      render json: { errors: errors.messages }, status: 422
    end
  end

  def destroy
    @inventory = Inventory.where(:user_id => current_user).where(:id => params[:id]).first
    @inventory.destroy

    head 204
  end

  def search
    item = params[:item]
    @results = []
    @results = Inventory.where(:user_id => current_user)
                .where('name LIKE ?'\
                    'OR item_number LIKE ?', "%#{item}%", "%#{item}%")
    if item.present?
      render json: @results
    end
  end

  private
    def inventory_params
      params.permit(:item_number, :name, :price, :tax, :user_id)
    end

end