class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(uid: params[:uid], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def login_form; end

  def login
    user = User.find_by(uid: params[:uid])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :login_form
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
