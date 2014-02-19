class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(params[:user])

    if user
      signin_user(user)
      redirect_to user, notice: "Successfully logged in"
    else
      flash.now[:alert] = "Bad username/password combo."
      render :new
    end
  end

  def destroy
    signout!
    redirect_to root_url, notice: "Successfully logged you out!"
  end

end
