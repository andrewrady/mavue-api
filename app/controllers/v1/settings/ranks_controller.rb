class V1::Settings::RanksController < ApplicationController
  before_action :authenticate_user

  def index
    @rank = Rank.all.where(:user_id => current_user)
    render json: @rank
  end

  def create
    @rank = Rank.new(rank_params)
    @rank.user_id = current_user.id

    if @rank.save
      render json: @rank, status: 201
    else
      render json: { errors: errors.message }, status: 422
    end
  end

  def update
    @rank = Rank.where(:user_id => current_user).where(:id => params[:id])

    if @rank.update(rank_params)
      render json: @rank, status: 201
    else
      render json: { errors: errors.message }, status: 422
    end
  end

  def destroy
    @rank = Rank.where(:user_id => current_user).where(:id => params[:id]).first
    @rank.destroy

    head 204
  end

  private
    def rank_params
      params.permit(:name, :order, :user_id)
    end
end