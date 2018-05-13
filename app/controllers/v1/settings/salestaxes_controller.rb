class V1::Settings::SalestaxesController < ApplicationController
  before_action :authenticate_user
  
  def index
    @tax = SalesTax.all.where(:user_id => current_user)
    render json: @tax
  end
end