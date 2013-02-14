class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :activated_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @actions = @user.actions.paginate(page: params[:page])
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @user.actions.create!(
        type: "SignUp",
        desc: "signed up for Spectre and is waiting for account approval")
      flash[:success] = "Welcome to Spectre. Your account will be activated
                         by your administrator within two hours."
      redirect_to signin_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
 
  def destroy
    target_user = User.find(params[:id])
    target_user.toggle!(:activated)

    if target_user.activated?
      current_user.actions.create!(
        type: "Activate",
        desc: "activated the account belonging to #{target_user.name}")
      flash[:success] = "Account for #{target_user.name} activated."
    elsif !target_user.activated?
      current_user.actions.create!(
        type: "Deactivate",
        desc: "deactivated the account belonging to #{target_user.name}")
      flash[:success] = "Account for #{target_user.name} Deactivated."
    end

    redirect_to users_url
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end