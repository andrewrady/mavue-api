class V1::NotesController < ApplicationController
  before_action :authenticate_user
  
  def index
    @notes = Note.all.where(:student_id => params[:student_id])
    render json: @notes
  end

  def show
    @note  = Note.where(:student_id => params[:student_id], :id => params[:id])
    render json: @note
  end

  def create
    @note = Note.new(notes_params)

    if @note.save
      render json: @note, status: 201
    else
      render json: { errors: errors.message }, status: 422
    end
  end

  def update
    @note = Note.where(:student_id => params[:student_id], :id => params[:id])

    if @note.update(notes_params)
      render json: @note, status: 201
    else
      render json: { errors: errors.message }, status: 422
    end
  end

  def destroy
    @note = Note.where(:student_id => params[:student_id], :id => params[:id]).first
    @note.destroy

    head 204
  end

  private
    def notes_params
      params.permit(:description, :student_id)
    end

end