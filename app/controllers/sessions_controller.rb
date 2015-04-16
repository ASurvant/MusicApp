class SessionsController < ApplicationController
  # before_action :prevent_double_login, except: [:destroy]

  # re-set the appropriate user's session_token and session[:session_token]
  def create
    @user = User::find_by_credentials(params[:user][:email], params[:user][:password])
    if @user.nil?
      render :new
    else
      @user.reset_session_token!
      login!(@user)
      redirect_to # example_url
    end
  end

  # redirect them to a User#show page which simply displays that user's email
  def new
    render :new
  end
end
