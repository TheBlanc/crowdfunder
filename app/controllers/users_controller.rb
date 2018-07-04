class UsersController < ApplicationController
before_action :load_users, only:[:show, :edit, :update, :destory]
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      session[:user_id] = @user.id
      redirect_to projects_url
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
  def update
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save

      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end

  def load_users
    @user = User.find(params[:id])
  end





end
