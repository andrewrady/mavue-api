class V1::InstructorController < ApplicationController
  before_action :authenticate_user

  def search 
    name = params[:name]
    @results = []
    @results = Student.where(:user_id => current_user)
                      .where('first_name LIKE ?'\
                     'OR last_name LIKE ?', "%#{name}%", "%#{name}%") 
                     .where(:Instructor => true)
    if name.present?
      render json: @results
    end
  end
end