class ChecklistsController < ApplicationController
  before_action :authenticate_user, only: [:destroy]

  def index
    current_user
    checklists = Checklist.all
    render json: checklists
  end

  def create
    id = current_user.id
    time = DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i)
    checklist = Checklist.new(
      user_id: id,
      name: params[:name],
      locId: params[:locId],
      time: time
    )
    if checklist.save
      checklist.populate_possible_birds
      render json: checklist
    else
      render json: {errors: checklist.errors.full_messages},status: :unprocessable_entity
    end
  end

  def show
    checklist = Checklist.find(params[:id])
    render json: checklist
    # if current_user == checklist.user
    #   render json: checklist
    # else
    #   render json: {}, status: :unauthorized
    # end
  end

  def destroy
    checklist = Checklist.find(params[:id])
    checklist.destroy
    render json: {message: "Checklist deleted successfully."}
  end

end
