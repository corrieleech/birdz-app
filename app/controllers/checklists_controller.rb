class ChecklistsController < ApplicationController
  before_action :authenticate_user, only: [:destroy]

  def index
    current_user
    checklists = Checklist.all
    render json: checklists
  end

  def create
    id = current_user.id
    checklist = Checklist.new(
      user_id: id,
      name: params[:name],
      locId: params[:locId],
      time: params[:time]
    )
    if checklist.save
      render json: checklist
    else
      render json: {errors: checklist.errors.full_messages},status: :unprocessable_entity
    end
  end

  def show
    checklist = Checklist.find(params[:id])
    if current_user == checklist.user
      render json: checklist
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    checklist = Checklist.find(params[:id])
    checklist.destroy
    render json: {message: "Checklist deleted successfully."}
  end

end
