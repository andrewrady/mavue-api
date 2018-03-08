class V1::SalesController < ApplicationController
  before_action :authenticate_user

  def index
    @student = Student.where(:user_id => current_user).find(params[:student_id])
    @sales = @student.sales
    render json: @sales
  end

  def show
    #Needs to be refactored  to include current user to stop user from accessing other peoples records
    ##Testing query that will queries the wrong columns
    # @student = Student.where(:user_id => current_user).joins(:sales).where(:id => params[:student_id], :id => params[:id]).all
    @sale = Sale.where(:student_id => params[:student_id], :id => params[:id])
    render json: @sale
  end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      render json: @sale, status: 201
    else
      render json: { errors: errors.message }, status: 422
    end
  end

  def update
    @sale = Sale.where(:student_id => params[:student_id], :id => params[:id])
    
    # render json: @sale
    if @sale.update(sale_params)
      render json: @sale, status: 201
    else
      render json: { errors: errors.message }, status: 422
    end
  end

  def destroy
    @sale = Sale.where(:student_id => params[:student_id], :id => params[:id]).first
    @sale.destroy

    head 204
  end

  private
    def sale_params
      params.permit(:student_id, :total, :items => [:item_number, :item_name, :price])
    end


end