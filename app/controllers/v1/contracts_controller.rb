class V1::ContractsController < ApplicationController
  before_action :authenticate_user

  def index
    @contracts = Contract.all.where(:head_of_house_id => params[:head_of_houses_id])
    render json: @contracts
  end

  def show
    @contract = Contract.where(:head_of_house_id => params[:head_of_house_id]).where(:id => params[:id])
    render json: @contract
  end

  def create
    @contract = Contract.new(contracts_params)
    @contract.head_of_house_id = params[:head_of_house_id]

    if @contract.save
      render json: @contract, status: 201
    else
      render json: @contract.errors, status: 422
    end
  end

  def update
    @contract = Contract.where(:head_of_house_id => params[:head_of_house_id]).where(:id => params[:id])

    if @contract.update(contracts_params)
      render json: @contract, status: 201
    else
      render json: @contract.errors, status: 422
    end
  end

  def destroy
    @contract = Contract.where(:head_of_house_id => params[:head_of_house_id]).where(:id => params[:id]).first
    @contract.destroy

    head 204
  end

  private 
    def contracts_params
      params.permit(:startDate, :endDate, :lastFour, :amount)
    end
end