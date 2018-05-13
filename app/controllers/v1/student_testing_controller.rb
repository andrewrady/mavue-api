class V1::StudentTestingController < ApplicationController
  before_action :authenticate_user
  
  def index
    @testing = TestingStudent.where(:student_id => params[:student_id])
    render json: @testing
  end

  def show
    @testing = TestingStudent.where(:student_id => params[:student_id], :id => params[:id])
    render json: @testing
  end
  
end