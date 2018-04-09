class V1::TestingController < ApplicationController
  
  def index
    @testing = Testing.all

    render json: @testing, :include => [:testing_student, :testing_instuctor]
  end

  def show
    @testing = Testing.where(:id => params[:id])
    render json: @testing, :include => [:testing_student, :testing_instuctor]
  end

  def create
    @testing = Testing.new(testing_params)
    # @testing.testing_student.build(student_params)

    if @testing.save
      render json: @testing, status: 201
    else
      render json: @testing.errors, status: 422
    end
  end

  def update
    @testing = Testing.where(:id => params[:id])

    if @testing.update
      render json: @testing, status: 201
    else
      render json: { errors: errors.message }, status: 422
    end
  end

  def destroy
    @testing = Testing.where(:id => params[:id])
    @testing.destroy
    head 204
  end

  private
    def testing_params
      params.permit(:complete, :user_id, testing_student_attributes: [:student_id, :testing_id, :first_name, :last_name, :total, :form, :weapon, :sparring, :board])
    end
end