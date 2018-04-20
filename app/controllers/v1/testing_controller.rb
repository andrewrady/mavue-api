class V1::TestingController < ApplicationController
  before_action :authenticate_user

  def index
    @testing = Testing.all.where(:user_id => current_user)

    render json: @testing, :include => [:testing_student, :testing_instructor]
  end

  def show
    @testing = Testing.where(:user_id => current_user).where(:id => params[:id])
    render json: @testing, :include => [:testing_student, :testing_instructor]
  end

  def create
    @testing = Testing.new(testing_params)

    if @testing.save
      render json: @testing, :include => [:testing_student, :testing_instructor], status: 201
    else
      render json: @testing.errors, status: 422
    end
  end

  def update
    @testing = Testing.where(:id => params[:id])

    if @testing.update
      render json: @testing, :include => [:testing_student, :testing_instructor], status: 201
    else
      render json: { errors: errors.message }, status: 422
    end
  end

  def destroy
    @testing = Testing.where(:id => params[:id]).first
    @testing.destroy
    head 204
  end

  private
    def testing_params
      params.permit(:complete, :user_id, 
        testing_student_attributes: [:student_id, :testing_id, :first_name, :last_name, :total, :form, :weapon, :sparring, :board],
        testing_instructor_attributes: [:first_name, :last_name, :rank, :testing_id])
    end
end