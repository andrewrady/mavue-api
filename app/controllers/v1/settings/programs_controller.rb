class V1::Settings::ProgramsController < ApplicationController 
  before_action :authenticate_user

  def index
    @programs = Program.all.where(:user_id => current_user)
    render json: @programs
  end

  def create
    @program = Program.new(program_params)
    @program.user_id = current_user.id

    if @program.save
      render json: @program, status: 201
    else
      render json: { errors: errors.message }, status: 422
    end
  end

  def destroy
    @program = Program.where(:user_id => current_user).where(:id => params[:id]).first
    @program.destroy

    head 204
  end

  private 
    def program_params
      params.permit(:title, :start, :end, :duration, :price, :downPayment)
    end
end