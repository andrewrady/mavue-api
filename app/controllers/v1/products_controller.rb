class V1::ProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @product = Product.all().where(:user_id => current_user)
    render json: @product
  end

  def create
    product = Stripe::Product.create({
      name: params[:name],
      type: 'service',
    })

    @product = Product.new(plan_params)
    @product.user_id = current_user.id
    @product.stripe_id = product.id

    if @product.save
      render json: @product, status: 201
    else
      render json: { errors: errors.messages }, status: 422
    end
  end

  def show

  end

  def update

  end

  def destroy

  end

  private
    def plan_params
      params.permit(:name)
    end
end