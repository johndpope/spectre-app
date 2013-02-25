class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && !user.activated?
      flash.now[:error] = 'Your account is not activated. Please contact your 
                           administrator.'
      render 'new'
    elsif user && user.authenticate(params[:session][:password]) &&
          user.activated?
      sign_in user
      current_user.actions.create!(
        type: "SignIn",
        desc: "signed in",
        content: "SignIn action")
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    if signed_in?
      current_user.actions.create!(
        type: "SignOut",
        desc: "signed out",
        content: "SignOut action")
    end
    sign_out
    redirect_to root_url
  end
end
