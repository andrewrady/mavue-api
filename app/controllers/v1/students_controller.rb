class V1::StudentsController < ApplicationController
  before_action :authenticate_user

  def index
    @student = Student.all().where(:user_id => current_user)
    render json: @student
  end

  def show
    @student = Student.where(:user_id => current_user).where(:id => params[:id])
    render json: @student, include: 'sales'
  end

  def create
    @student = Student.new(student_params)
    @student.user_id = current_user.id

    if @student.save
      render json: @student, status: 201
    else
      render json: { errors: errors.message }, status: 422
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

  def search
    name = params[:name]
    @results = []
    @results = Student.where(:user_id => current_user)
                      .where('first_name ILIKE ?'\
                     'OR last_name ILIKE ?', "%#{name}%", "%#{name}%") 
    if name.present?
      render json: @results
    end
  end

  private
    def student_params
      params.permit(:first_name, :last_name, :phoneNumber, :address, :city, 
        :state, :zip, :rank, :ata_number, :Instructor, :user_id, :head_of_house_id,
        :email)
    end
end
