class V1::HeadOfHousesController < ApplicationController
  before_action :authenticate_user

  def index
    @hoh = HeadOfHouse.all.where(:user_id => current_user)
    render json: @hoh
  end

  def show
    @hoh = HeadOfHouse.where(:user_id => current_user).where(:id => params[:id])
    render json: @hoh, :include => [:contracts]
  end

  def create
    @hoh = HeadOfHouse.new(hoh_params)
    @hoh.user_id = current_user.id

    # render json: @hoh
    if @hoh.save
      render json: @hoh, status: 201
    else
      render json: @hoh.errors, status: 422
    end
  end

  def update
    @hoh = HeadOfHouse.where(:user_id => current_user).where(:id => params[:id])

    if @hoh.update(hoh_params)
      render json: @hoh, status: 201
    else
      render json: @hoh.errors, status: 422
    end      
  end

  def destroy
    @hoh = HeadOfHouse.where(:user_id => current_user).where(:id => params[:id]).first
    @hoh.destroy

    head 204
  end

  def search
    person = params[:person]
    @results = []
    @results = HeadOfHouse.where(:user_id => current_user)
      .where('firstName LIKE ?'\
            'OR lastName LIKE ?', "%#{person}%", "%#{person}%")
    if person.present?
      render json: @results
    else
      render json: []
    end
  end

  private
    def hoh_params
      params.permit(:firstName, :lastName, :state, :address, :zip, :email, :phoneNumber)
    end
end