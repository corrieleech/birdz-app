class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show, :update, :destroy]
  
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    if current_user == user
      user.name = params[:name] || user.name
      user.email = params[:email] || user.email
      if user.save
        render json: user
      else
        render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    user = User.find(params[:id])
    if current_user == user
      user.destroy
      render json: {message: "User has been deleted from the database"}, status: :ok
    else
      render json: {}, status: :unauthorized
    end
  end
  
end
