class SessionsController < ApplicationController

  def new
  end

  def create
    if request.env['omniauth.auth']
      fb_data = request.env['omniauth.auth']
      @user = User.find_by_uid(fb_data[:uid])

      unless @user
        @user = User.create_from_fb_data(fb_data)
      end

    else
      @user = User.find_by_credentials(params[:user])
    end

    if @user
      signin_user(@user)
      redirect_to @user, notice: "Successfully logged in"
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
