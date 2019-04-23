class V1::EmailsController < ApplicationController

  def index
    @emails = Email.all()
    render json: @emails
  end

  def create 
    @email = Email.new(emails_params)
    
    if @email.save
      render json: @email, status: 201
    else
      render json: @email.errors, status: 422
    end
  end

  private
    def emails_params
      params.permit(:name, :email, :message)
    end
end