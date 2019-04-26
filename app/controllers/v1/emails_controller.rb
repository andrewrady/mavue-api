class V1::EmailsController < ApplicationController
  before_action :authenticate_user

  def index
    @emails = Email.all().where(:user_id => current_user)
    render json: @emails
  end

  def create 
    @email = Email.new(emails_params)
    @email.user_id = current_user.id
    
    if @email.save
      render json: @email, status: 201
    else
      render json: @email.errors, status: 422
    end
  end

  def update
    @email = Email.where(:id => params[:id])

    if @email.update(emails_params)
      render json: @email, status: 201
    else
      render json: @email.errors, status: 422
    end
  end

  def unread
    @emails = Email.all.where(:user_id => current_user).where(:read => false)
    @total = @emails.count

    render json: @total
  end

  private
    def emails_params
      params.permit(:name, :email, :message)
    end
end