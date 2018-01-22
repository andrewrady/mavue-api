class V1::StudentsController < ApplicationController
  before_action :authenticate_user

  def index
    @student = Student.all
    render json: @student
  end

  def show
    @student = Student.where(:id => params[:id])

    render json: @student
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: 201
    else
      render json: { errors: error.message }, status: 422
    end
  end

  def update
    @student = Student.where(:id => params[:id])

    if @student.update(student_params)
      render json: @student, status: 201
    else
      render json: { errors: errors.message }, status: 422
    end
  end

  def destroy
    @student = Student.where(:id => params[:id]).first
    @student.destroy

    head 204
  end

  private
    def student_params
      params.permit(:first_name, :last_name, :address, :city, :state, :zip, :rank, :ata_number)
    end
end