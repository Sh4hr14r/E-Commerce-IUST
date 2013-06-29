class PasswordResetsController < ApplicationController

  skip_before_filter :no_access
  def new
  end

  def create
    user=User.find_by_email(params[:email])
    user.send_pass_reset if user
    redirect_to root_url, :notice => "Instructions has been sent to your email for resetting your password."
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 1.day.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render "edit"

    end
  end

end
