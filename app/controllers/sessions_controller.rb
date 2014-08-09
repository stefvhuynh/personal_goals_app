class SessionsController < ApplicationController
  before_filter :require_logged_in!, only: :destroy
  before_filter :require_logged_out!, except: :destroy

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:session][:username],
      params[:session][:password]
    )

    if @user.nil?
      flash.now[:errors] = ["Invalid username/password combination"]
      render :new
    else
      log_in!(@user)
      redirect_to goals_url
    end
  end

  def destroy
    log_out!
    redirect_to root_url
  end

end
