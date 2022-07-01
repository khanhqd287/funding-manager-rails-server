class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    begin
      @user = User.find_by(email: params[:email])
      command = AuthenticateUser.call(params[:email], params[:password])

      if command.successful?
        render(json: { auth_token: command.result })
      else
        render(json: { error: command.errors }, status: :unauthorized)
      end
    rescue ActiveRecord::RecordNotFound  
      @user = @user = User.create!(email: params[:email], password: params[:password])
      if @user.save
        command = AuthenticateUser.call(params[:email], params[:password])
        if command.successful?
          render(json: { auth_token: command.result })
        else
          render(json: { error: command.errors }, status: :unauthorized)
        end
      else
        render(json: @user.errors, status: :bad)
      end
    end
  end
end
