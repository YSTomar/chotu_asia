class UserSessionsController < ApplicationController
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params)

    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default account_url(@current_user)
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end

  private  
    def user_session_params
      params[:user_session]
    end
end
