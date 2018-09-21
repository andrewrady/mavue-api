class V1::SubscriptionsController < ApplicationController 
  before_action :authenticate_user

  def index
    @subscription = Subscription.all().where(:product_id => params[:product_id])
    render json: @subscription
  end

  def create 
    @subscription = Subscription.new(plan_params)
    @subscription.product_id =  params[:product_id]

    @product = Product.find(params[:product_id])
    plan = Stripe::Plan.create({
      currency: 'usd',
      interval: params[:interval],
      product: @product.stripe_id,
      nickname: params[:name],
      amount: (params[:price] * 100).to_i,
    })

    if @subscription.save
      render json: @subscription, status: 201
    else
      render json: { errors: errors.message }, status: 422
    end
  end

  def show 
    @subscription = Subscription.where(:product_id => params[:product_id]).where(:id => params[:id]).first
    render json: @subscription, status: 201
  end

  private
    def plan_params
      params.permit(:name, :price, :product_id, :interval)
    end
end