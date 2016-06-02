class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @email = ''
    render :new
  end

  def create
    login_creds = login_params
    if @user = User.find_by_credentials(login_creds[:email], 
                                        login_creds[:password])
      login_user!(@user)
      redirect_to user_url(@user.id)
    else
      @email = login_creds[:email]
      render :new
    end
  end

  def destroy
    logout_user!(current_user)
    redirect_to login_url
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
