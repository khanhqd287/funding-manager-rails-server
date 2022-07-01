class UsersController < ApplicationController
  def register
    skip_before_action :authenticate_request
    @user = User.create!(user_params)
    if @user.save
      render(json: { message: "User created successfully" }, status: :created)
    else
      render(json: @user.errors, status: :bad)
    end
  end

  def show
    authorize!(:read)
    if params[:id].empty? || params[:id] == "me"
      render(json: { data: @current_user, code: 0 })
    else
      user = User.find(params[:id])
      render(json: { data: user, code: 0 })
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
