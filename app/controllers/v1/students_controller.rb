class V1::StudentsController < ApplicationController

  def index
    @ring = ['test']
    render json: @ring
  end
end