class SessionsController < ApplicationController
  def new; end

  def create
    user = User.authenticate(session_params)
    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, notice: "Login succes as #{user.email}!"
    else
      flash.now.alert = 'Wrong email or password!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end

  private

  def session_params
    params.permit(:email, :user_password, :user_id).to_h.symbolize_keys
  end
end
