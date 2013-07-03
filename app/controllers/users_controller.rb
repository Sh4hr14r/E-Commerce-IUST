##
#* this class controls the user actions
#* created manually
class UsersController < ApplicationController

  def new
    ##
    # new user in database will be created
    @user = User.new
  end

  def create
    ##
    # checks the user creation (sign up process)
    @user =User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end
