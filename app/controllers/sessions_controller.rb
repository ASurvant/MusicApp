class SessionsController < ApplicationController

  def create
    @user = User::find_by_credentials(params[:user][:email], params[:user][:password])
    if @user.nil?
      render :new
    else
      @user.reset_session_token!
      login!(@user)
      redirect_to user_show
    end
  end

  def new
    render :new
  end
end
